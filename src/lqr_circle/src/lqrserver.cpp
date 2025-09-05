
#include <iostream>
#include <math.h>
#include <random>
#include <eigen3/Eigen/Dense>
#include <ros/ros.h>
#include <vector>
#include <tf/transform_datatypes.h>
#include <nav_msgs/Odometry.h>

#include <nav_msgs/Path.h>
#include <geometry_msgs/PoseStamped.h>
#include <visualization_msgs/Marker.h>

#include <livox_ros_driver2/CustomMsg.h>  // Livox消息
#include <sensor_msgs/PointCloud2.h>     // 通用点云消息
#include <pcl/point_types.h>             // PCL点类型


#include "lqr_track/Tool.h"
#include "lqr_track/LQR.h"
#include <pcl/filters/crop_box.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/filters/statistical_outlier_removal.h>

#include <ackermann_msgs/AckermannDrive.h>
#include <yhs_can_msgs/ctrl_cmd.h>
#include <yhs_can_msgs/steering_ctrl_cmd.h>

using namespace std;
#define T 1/freq

bool NO_received_mission_FLAG_ = true;
bool lidar_stop_obstacle_FLAG_ = false;

bool detect_FLAG_ = false;
bool stop_FLAG_ = false;
bool arrive_mission_FLAG = false;
bool forward_mode_FLAG_ = false;
bool mission_mode_change_FLAG_ = false;

class Path
{
private:
    vector<waypoint> path;
public:
    //添加新的路径点
    typedef unique_ptr<Path> Ptr;
    void Add_new_point(waypoint& p){
        path.push_back(p);
    }

    void Add_new_point(vector<waypoint>& p){
        path = p;
    }

    void clear(){
        path.clear();
    }

    //路径点个数
    unsigned int Size(){
        return path.size();
    }

    //获取路径点
    waypoint Get_waypoint(int index){
        waypoint p;
        p.ID = path[index].ID;
        p.x = path[index].x;
        p.y = path[index].y;
        p.yaw = path[index].yaw;
        return p;
    }

    vector<waypoint> Get_waypoints(){
        return path;
    }

    // 搜索路径点, 将小车到起始点的距离与小车到每一个点的距离对比，找出最近的目标点索引值
    int Find_target_index(vehicleState state){
        double min = abs(sqrt(pow(state.x - path[0].x, 2) + pow(state.y - path[0].y, 2)));
        int index = 0;
        for (int i = 0; i < path.size(); i++){
            double d = abs(sqrt(pow(state.x - path[i].x, 2) + pow(state.y - path[i].y, 2)));
            if (d < min){
                min = d;
                index = i;
            }
        }
        //索引到终点前，当（机器人与下一个目标点的距离Lf）小于（当前目标点到下一个目标点距离L)时，索引下一个目标点
        if ((index + 1) < path.size()){
            double current_x = path[index].x; double current_y = path[index].y;
            double next_x = path[index + 1].x; double next_y = path[index + 1].y;
            double L_ = abs(sqrt(pow(next_x - current_x, 2) + pow(next_y - current_y, 2)));
            double L_1 = abs(sqrt(pow(state.x - next_x, 2) + pow(state.y - next_y, 2)));
            //ROS_INFO("L is %f,Lf is %f",L,Lf);
            if (L_1 < L_){
                index += 1;
            }
        }
        return index;
    }
};

class ObstacleDetect
{
private:
    ros::NodeHandle nh_;

    ros::Subscriber livox_pc_front_sub_;
    ros::Publisher collision_pc_pub_;

    int dep_count_thres_;
    double dep_value_thres_;

    pcl::CropBox<pcl::PointXYZ> front_box_filter_;
    pcl::CropBox<pcl::PointXYZ> back_box_filter_;
    pcl::PointCloud<pcl::PointXYZ>::Ptr front_local_pc_;
    pcl::PointCloud<pcl::PointXYZ>::Ptr back_local_pc_;

    sensor_msgs::PointCloud2 pointcloud_data_pub_;

private:
    void lidarfrontCallBack(const livox_ros_driver2::CustomMsg::ConstPtr& msg);

public:
    ObstacleDetect();
    ~ObstacleDetect(){};
};

ObstacleDetect::ObstacleDetect(){
    livox_pc_front_sub_ = nh_.subscribe("/livox/lidar_192_168_2_150", 10, &ObstacleDetect::lidarfrontCallBack, this);
    collision_pc_pub_ = nh_.advertise<sensor_msgs::PointCloud2>("/velodyne_filiter", 1);

    //lidar stop
    front_local_pc_.reset(new pcl::PointCloud<pcl::PointXYZ>);

    front_box_filter_.setMin(Eigen::Vector4f( 0.5 ,-0.3 , 0.0 ,1.0));
    front_box_filter_.setMax(Eigen::Vector4f( 0.8 ,0.3 , 0.3 ,1.0));
    front_box_filter_.setNegative(false);
}

// 定义回调函数
void ObstacleDetect::lidarfrontCallBack(const livox_ros_driver2::CustomMsg::ConstPtr& msg) {
    if (NO_received_mission_FLAG_) return;  // 如果没有接收到任务则返回

    // 清空之前的点云数据
    front_local_pc_->clear();

    // 将 Livox 点云数据转换为 PCL 点云
    pcl::PointCloud<pcl::PointXYZ> pcl_pc;
    pcl_pc.points.reserve(msg->points.size());

    for (size_t i = 0; i < msg->points.size(); i++) {
        // 获取每个点的信息
        pcl::PointXYZ point;
        point.x = msg->points[i].x;
        point.y = msg->points[i].y;
        point.z = msg->points[i].z;

        // 添加到 PCL 点云中
        pcl_pc.points.push_back(point);
    }

    // 使用 pcl::CropBox 过滤前方的点云区域
    pcl::PointCloud<pcl::PointXYZ>::Ptr collision_pc(new pcl::PointCloud<pcl::PointXYZ>());
    front_box_filter_.setInputCloud(pcl_pc.makeShared());
    front_box_filter_.filter(*collision_pc);

    // 转换 PCL 点云为 ROS 消息格式
    sensor_msgs::PointCloud2 collision_pc_msg;
    pcl::toROSMsg(*collision_pc, collision_pc_msg);
    collision_pc_msg.header = msg->header;  // 保持与原始点云消息的头部信息一致

    // 发布过滤后的点云
    collision_pc_pub_.publish(collision_pc_msg);

    // 判断障碍物检测标志，根据障碍物点云的数量判断是否停止
    if (collision_pc->width > 20) {
        lidar_stop_obstacle_FLAG_ = true;  // 停止
    } else {
        lidar_stop_obstacle_FLAG_ = false; // 继续
    }
}

class LQRServer
{
private:
    vehicleState car;
    U control;
    double Q[3];
    double R[2];
    vector<double> Q_set;
    vector<double> R_set;
    vector<waypoint> waypoints;
    bool limit_v_and_kesi;
    int lastIndex;//最后一个点索引值
    waypoint lastPoint;//最后一个点信息
    double freq;
    double v_max;
    double car_length_;
    bool change_traj = false;
    double prev_error_ = 0.0;
    
    // 设置圆形轨迹的参数
    double circle_center_x_ = 0.0;  // 圆心的 x 坐标
    double circle_center_y_ = 0.0;  // 圆心的 y 坐标
    double radius_ = 1.2;           // 圆的半径
    int num_points_ = 1000;          // 圆轨迹上点的数量

    ros::NodeHandle nh_;
    ros::Subscriber ackerman_odom_sub_;
    ros::Subscriber diff_odom_sub_;

    ros::Publisher path_pub_;      // 发布 nav_msgs/Path
    ros::Publisher marker_pub_;    // 发布可视化 Marker
    ros::Publisher velcmdPub_;
    ros::Publisher yhs_velcmd_pub_;
    ros::Publisher yhs_velanglecmd_pub_;

    std::string ackerman_odom_topic_;
    std::string diff_odom_topic_;

    ackermann_msgs::AckermannDrive cmd_;
    yhs_can_msgs::steering_ctrl_cmd vel_cmd_;
    yhs_can_msgs::ctrl_cmd vel_angle_cmd_;

private:
    void ackermanodomCallback(const nav_msgs::Odometry::ConstPtr &msg);
    void diffodomCallback(const nav_msgs::Odometry::ConstPtr &msg);
    void pathChange(const double circle_center_x, const double circle_center_y);

public:
    LQR::Ptr controller;
    Path::Ptr path;

public:
    LQRServer(ros::NodeHandle &nh);
    ~LQRServer();
    void carTrackbyPath();
    void init(double ref_yaw);
    U v_and_kesi_limit(U control_value);
    void LQRpursuit(Eigen::Vector3d pos, double vel, double steer);
};

LQRServer::LQRServer(ros::NodeHandle &nh) : nh_(nh)
{
    controller.reset(new LQR);
    path.reset(new Path);

    nh_.param<string>("akeman_car_odom_topic", ackerman_odom_topic_, "/lio/Odometry");
    nh_.param<string>("diff_car_odom_topic", diff_odom_topic_, "/diff_car/lio/Odometry");
    nh_.param<double>("freq",freq, 20);
    nh_.param<double>("Length", car_length_, 1.0);
    nh_.param<double>("v_max", v_max, 1.0);
    nh_.param<bool>("limit_v_and_kesi",limit_v_and_kesi,true);
    Q_set.assign(3, 1.0);
    R_set.assign(2, 3.0);
    ackerman_odom_sub_ = nh_.subscribe<nav_msgs::Odometry>(ackerman_odom_topic_, 1, &LQRServer::ackermanodomCallback, this);
    diff_odom_sub_ = nh_.subscribe<nav_msgs::Odometry>(diff_odom_topic_, 1, &LQRServer::diffodomCallback, this);

    velcmdPub_ = nh_.advertise<ackermann_msgs::AckermannDrive>("/cmd_vel", 30);
    yhs_velcmd_pub_ = nh_.advertise<yhs_can_msgs::steering_ctrl_cmd>("/steering_ctrl_cmd",10);
    yhs_velanglecmd_pub_ = nh_.advertise<yhs_can_msgs::ctrl_cmd>("/ctrl_cmd",10);
    path_pub_   = nh_.advertise<nav_msgs::Path>("/circle_path", 1, true);
    marker_pub_ = nh_.advertise<visualization_msgs::Marker>("/circle_path_marker", 1, true);
    pathChange(0,0);
    vel_cmd_.ctrl_cmd_gear = 5;
    vel_angle_cmd_.ctrl_cmd_gear = 6;
    
}

LQRServer::~LQRServer(){
    vel_cmd_.steering_ctrl_cmd_velocity = 0;
    vel_cmd_.steering_ctrl_cmd_steering = 0;
    yhs_velcmd_pub_.publish(vel_cmd_);
}

void LQRServer::ackermanodomCallback(const nav_msgs::Odometry::ConstPtr &msg){
    car.x = msg->pose.pose.position.x;
    car.y = msg->pose.pose.position.y;
    car.yaw = tf::getYaw(msg->pose.pose.orientation);
}

void LQRServer::diffodomCallback(const nav_msgs::Odometry::ConstPtr &msg){
    double dis = (msg->pose.pose.position.x - circle_center_x_) * (msg->pose.pose.position.x - circle_center_x_) + (msg->pose.pose.position.y - circle_center_y_) * (msg->pose.pose.position.y - circle_center_y_);
    if(dis > 0.1){
        circle_center_x_ = msg->pose.pose.position.x;
        circle_center_y_ = msg->pose.pose.position.y;
        pathChange(circle_center_x_, circle_center_y_);
    }
    return;
}

void LQRServer::pathChange(const double circle_center_x, const double circle_center_y){
    // 清空现有的路径点
    waypoints.clear();

    // 生成圆形轨迹
    for (int i = 0; i < num_points_; ++i) {
        // 计算每个点的角度
        double angle = 2 * M_PI * i / num_points_;  // 均匀分布的角度
        double x = circle_center_x + radius_ * cos(angle);
        double y = circle_center_y + radius_ * sin(angle);

        // 计算 yaw（航向角），对于圆轨迹而言，yaw 与切线方向相关
        double yaw = angle + M_PI / 2;  // 方向与圆弧切线方向一致

        // 创建新的路径点
        waypoint wp;
        wp.ID = i;
        wp.x = x;
        wp.y = y;
        wp.yaw = yaw;  // 这里假设机器人始终沿着切线方向转
        waypoints.push_back(wp);
    }

    // 将生成的路径点添加到路径对象中
    path->Add_new_point(waypoints);
    lastIndex = path->Size() - 1;
    lastPoint = path->Get_waypoint(lastIndex);

    // 设置路径为已更改
    change_traj = true;

    nav_msgs::Path path_msg;
    std::string frame_id_ = "map"; 
    path_msg.header.stamp = ros::Time::now();
    path_msg.header.frame_id = frame_id_;
    path_msg.poses.reserve(waypoints.size());

    for (const auto& wp : waypoints) {
        geometry_msgs::PoseStamped ps;
        ps.header = path_msg.header;
        ps.pose.position.x = wp.x;
        ps.pose.position.y = wp.y;
        ps.pose.position.z = 0.0;
        ps.pose.orientation = tf::createQuaternionMsgFromYaw(wp.yaw);
        path_msg.poses.push_back(ps);
    }
    path_pub_.publish(path_msg);

    // ====== 发布到 RViz：LINE_STRIP Marker（画一圈）======
    visualization_msgs::Marker line;
    line.header = path_msg.header;
    line.ns = "circle_path";
    line.id = 0;
    line.type = visualization_msgs::Marker::LINE_STRIP;
    line.action = visualization_msgs::Marker::ADD;
    line.pose.orientation.w = 1.0;   // 线条自身不旋转
    line.scale.x = 0.03;              // 线宽（米）
    line.color.r = 1.0;               // 橙色
    line.color.g = 0.6;
    line.color.b = 0.0;
    line.color.a = 1.0;

    line.points.reserve(waypoints.size() + 1);
    for (const auto& wp : waypoints) {
        geometry_msgs::Point p;
        p.x = wp.x; p.y = wp.y; p.z = 0.0;
        line.points.push_back(p);
    }
    marker_pub_.publish(line);
    return;
}

void LQRServer::init(double ref_yaw){
    double k = 100.0;
    double kp = 5.0; // 比例增益
    double ki = 0; // 积分增益
    double kd = 0.05;
    ros::Rate rate(freq);
    while(abs(car.yaw - ref_yaw) > 0.1){
        ros::spinOnce();
        // 计算误差
        double error = ref_yaw - car.yaw;
        // cout << ref_yaw << "    " << car.yaw << endl;
        if(error > M_PI){
            error -= 2 * M_PI;
        }
        if(error < -M_PI){
            error += 2 * M_PI;
        }
        // 讘算微分项
        double derivative = error - prev_error_;
        // 计算控制输入
        double control_input = k *(kp * error + kd * derivative);
        // 更新prev_error
        prev_error_ = error;

        // cout << control_input << endl;

        if(control_input > 30)
        {
            control_input = 30;
        }
        else if(control_input < -30)
        {
            control_input = -30;
        }

        // vel_cmd_.steering_ctrl_cmd_velocity = 0;
        // vel_cmd_.steering_ctrl_cmd_steering = control_input;
        // yhs_velcmd_pub_.publish(vel_cmd_);
        vel_angle_cmd_.ctrl_cmd_linear = 0;
        vel_angle_cmd_.ctrl_cmd_angular = control_input;
        yhs_velanglecmd_pub_.publish(vel_angle_cmd_);
        cout<<"car.yaw"<<car.yaw<<",ref_yaw"<<ref_yaw<<endl;
        rate.sleep();
    }
}


void LQRServer::carTrackbyPath(){
    waypoint Point;
    ros::Rate rate(freq);
    ros::Rate detectstoprate(freq);

    change_traj = false;
    U U_r;
    double K;
    if(path->Size() == 0){
        NO_received_mission_FLAG_ = true;
        return;
    }
    cout << "I have a path now !!!" << endl;
    NO_received_mission_FLAG_ = false;

    // lfh:需要寻找最近点而不是第一个点
    int nearst_index = path->Find_target_index(car);
    double ref_yaw = path->Get_waypoint(nearst_index).yaw;

    cout << car.yaw << "     " << ref_yaw << endl;
    init(ref_yaw);

    double time1 = ros::Time::now().toSec();
    double time2 = ros::Time::now().toSec();
    while(time2 - time1 < 2)
    {
        time2 = ros::Time::now().toSec();
        vel_angle_cmd_.ctrl_cmd_linear = 0;
        vel_angle_cmd_.ctrl_cmd_angular = 0;
        yhs_velanglecmd_pub_.publish(vel_angle_cmd_);
        rate.sleep();
    }
    int target_index = nearst_index + 100;
    bool first = true;
    while (ros::ok())
    {
        ros::spinOnce();
        if (change_traj){
            break;
        }
        
        if(first){
            first = false;
        }else{
            target_index = path->Find_target_index(car);
            target_index = target_index + 1;
        }
        waypoint target_point = path->Get_waypoint(target_index);
        
        Point = path->Get_waypoint(target_index);
        K = cal_K(path->Get_waypoints(), target_index);//计算曲率
        if(target_index == lastIndex) target_index = 0;
        

        U_r.v = 0.8;
        U_r.kesi = atan2(car_length_ * K, 1);

        //权重矩阵
        for(int q = 0; q < Q_set.size(); q++)
            Q[q] = Q_set[q];
        for(int r = 0; r < R_set.size(); r++)
            R[r] = R_set[r];
        if(Q[0] >= R[0] || Q[1] >= R[1])
            ROS_WARN("Q >= R, the calculation result may be abnormal,please set Q < R ");

        controller->initial(car_length_, T, car, Point, U_r, Q, R);//初始化控制器
        control = controller->cal_vel();//计算输入[v, kesi]
        if(U_r.v == 0)
            control.v = 0;//判断，期望速度为0，则机器人停下
        if(limit_v_and_kesi)
            control = v_and_kesi_limit(control);//速度和前轮转角限幅

        if(lidar_stop_obstacle_FLAG_) {
            while(lidar_stop_obstacle_FLAG_ && ros::ok()){
                cout << "检测到障碍物！！！！！" << endl;
                ros::spinOnce();
                vel_cmd_.steering_ctrl_cmd_velocity = 0;
                vel_cmd_.steering_ctrl_cmd_steering = 0;
                yhs_velcmd_pub_.publish(vel_cmd_);
                detectstoprate.sleep();
            }
            double time1 = ros::Time::now().toSec();
            double time2 = ros::Time::now().toSec();
            while(time2 - time1 < 2)
            {
                time2 = ros::Time::now().toSec();
                vel_angle_cmd_.ctrl_cmd_linear = 0;
                vel_angle_cmd_.ctrl_cmd_angular = 0;
                yhs_velanglecmd_pub_.publish(vel_angle_cmd_);
                rate.sleep();
            }
        }
        vel_cmd_.steering_ctrl_cmd_velocity = control.v;
        vel_cmd_.steering_ctrl_cmd_steering = control.kesi * 180 * M_1_PI;
        yhs_velcmd_pub_.publish(vel_cmd_);
        rate.sleep();
    }
}

U LQRServer::v_and_kesi_limit(U control_value){
    if(control_value.v >= v_max){
        control_value.v = v_max;
        ROS_WARN("The calculated velocity is too large ");
    }
    else if(control_value.v <= -v_max){
        control_value.v = -v_max;
        ROS_WARN("The calculated velocity is too small ");
    }
    if(control_value.kesi >= M_PI/2){
        control_value.kesi = M_PI/2;
        ROS_WARN("The calculated kesi is too large");
    }
    else if(control_value.kesi <= -M_PI/2){
        control_value.kesi = -M_PI/2;
        ROS_WARN("The calculated kesi is too small");
    }
    return control_value;
}

void LQRServer::LQRpursuit(Eigen::Vector3d pos, double vel, double steer)
    {
    waypoint Point;
    ros::Rate rate(freq);
    U U_r;
    double K;

    Point.x = pos(0);
    Point.y = pos(1);
    Point.yaw = pos(2);

    U_r.v = vel;
    U_r.kesi = steer;

    //权重矩阵
    for(int q = 0; q < Q_set.size(); q++)
        Q[q] = Q_set[q];
    for(int r = 0; r < R_set.size(); r++)
        R[r] = R_set[r];
    if(Q[0] >= R[0] || Q[1] >= R[1])
        ROS_WARN("Q >= R, the calculation result may be abnormal,please set Q < R ");

    //使用LQR控制器
    controller->initial(car_length_, T, car, Point, U_r, Q, R);//初始化控制器
    control = controller->cal_vel();//计算输入[v, kesi]

    if(U_r.v == 0)
        control.v = 0;//判断，期望速度为0，则机器人停下
    if(limit_v_and_kesi)
        control = v_and_kesi_limit(control);//速度和前轮转角限幅
    cmd_.speed = control.v;
    cmd_.steering_angle = control.kesi * 180 * M_1_PI;
    velcmdPub_.publish(cmd_);
}

int main(int argc, char** argv){
    ros::init(argc, argv, "lqr_track");
    ros::NodeHandle nh;
    LQRServer LqrServer(nh);
    ObstacleDetect Obstacledetect;
    ros::Rate rate(10);

    while(ros::ok())
    {
        ros::spinOnce();
        LqrServer.carTrackbyPath();
        rate.sleep();
    }
    ros::spin();
}