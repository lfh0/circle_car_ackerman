#include <iostream>
#include <Eigen/Dense>
#include "Tool.h"

using namespace std;

typedef Eigen::Matrix<double, 3, 3> Matrix3x3;
typedef Eigen::Matrix<double, 3, 1> Matrix3x1;
typedef Eigen::Matrix<double, 2, 1> Matrix2x1;
typedef Eigen::Matrix<double, 2, 2> Matrix2x2;
typedef Eigen::Matrix<double, 3, 2> Matrix3x2;
typedef Eigen::Matrix<double, 2, 3> Matrix2x3;

class LQR
{
private:
	Matrix3x3 A_d;
	Matrix3x2 B_d;
	Matrix3x3 Q;
	Matrix2x2 R;
	Matrix3x1 X_e;
	Matrix2x1 U_e;
	
	double L;//车辆轴距
	double T;//采样间隔
	double x_car, y_car, yaw_car, x_d, y_d, yaw_d;//车辆位姿和目标点位姿
	double v_d, kesi_d;//期望速度和前轮偏角
	double Q3[3];//Q权重，三项
	double R2[2];//R权重，两项
	int temp = 0;
public:
	//初始化控制器
	void initial(double L_, double T_, vehicleState car, waypoint waypoint, U U_r, double* Q_, double* R_)
	{
		L = L_;
		T = T_;
		x_car = car.x; y_car = car.y; yaw_car = car.yaw;
		x_d = waypoint.x; y_d = waypoint.y; yaw_d = waypoint.yaw;
		v_d = U_r.v; kesi_d = U_r.kesi;

		for (int i = 0; i < 3; i++) {
			Q3[i] = Q_[i];
		}
		for (int j = 0; j < 2; j++) {
			R2[j] = R_[j];
		}
	}
	//构造状态方程参数
	void param_struct()
	{
		Q << Q3[0], 0.0, 0.0,
			0.0, Q3[1], 0.0,
			0.0, 0.0, Q3[2];
		//cout << "Q矩阵为：\n" << Q << endl;
		R << R2[0], 0.0,
			0.0, R2[1];
		//cout << "R矩阵为：\n" << R << endl;
		A_d << 1.0, 0.0, -v_d * T * sin(yaw_d),
			0.0, 1.0, v_d* T* cos(yaw_d),
			0.0, 0.0, 1.0;
		//cout << "A_d矩阵为:\n" << A_d << endl;
		B_d << T * cos(yaw_d), 0.0,
			T* sin(yaw_d), 0.0,
			T* tan(kesi_d) / L, v_d* T / (L * cos(kesi_d) * cos(kesi_d));
		//cout << "B_d矩阵为:\n" << B_d << endl;
		// cout << yaw_car << "      " << yaw_d << endl;
		double yaw_error = yaw_car - yaw_d;
		if(yaw_error > M_PI)
		{
			yaw_error -= 2 * M_PI;
		}
		else if(yaw_error < -M_PI)
		{
			yaw_error += 2 * M_PI;
		}
		X_e << x_car - x_d, y_car - y_d, yaw_error;
		// cout << "X_e矩阵为:\n" << X_e << endl;
	}
	//黎卡提方程求解
	Matrix2x3 cal_Riccati()
	{
		int N = 100;//迭代终止次数
		double err = 100;//误差值
		double err_tolerance = 0.01;//误差收敛阈值
		Matrix3x3 Qf = Q;
		Matrix3x3 P = Qf;//迭代初始值
		//cout << "P初始矩阵为\n" << P << endl;
		Matrix3x3 Pn;//计算的最新P矩阵
		for (int iter_num = 0; iter_num < N; iter_num++) {
			Pn = Q + A_d.transpose() * P * A_d - A_d.transpose() * P * B_d * (R + B_d.transpose() * P * B_d).inverse() * B_d.transpose() * P * A_d;//迭代公式
			//cout << "收敛误差为" << (Pn - P).array().abs().maxCoeff() << endl;
			//err = (Pn - P).array().abs().maxCoeff();//
			err = (Pn - P).lpNorm<Eigen::Infinity>();
			if(err < err_tolerance)//
			{
				P = Pn;
				//cout << "迭代次数" << iter_num << endl;
				break;
			}
			P = Pn;
			
		}
		
		//cout << "P矩阵为\n" << P << endl;
		//P = Q;
		Matrix2x3 K = -(R + B_d.transpose() * P * B_d).inverse() * B_d.transpose() * P * A_d;//反馈率K
		return K;
	}
	//LQR控制器计算速度
	U cal_vel()
	{
		U output;
		param_struct();
		Matrix2x3 K = cal_Riccati();
		Matrix2x1 U = K * X_e;
		// cout << "U: " << U[0] << "     " << U[1] << endl;
		// cout << "反馈增益K为：\n" << K << endl;
		// cout << "控制输入U为：\n" << U << endl;
		output.v = U[0] + v_d;
		output.kesi = U[1] + kesi_d;
		// cout << "output.v: " << output.v << "   output.kesi: " << output.kesi << endl;
		return output;
	}
public:
	typedef unique_ptr<LQR> Ptr;
};