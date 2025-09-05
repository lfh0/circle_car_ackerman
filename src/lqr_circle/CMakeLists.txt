cmake_minimum_required(VERSION 3.0.2)
project(lqr_circle)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  sensor_msgs
  pcl_conversions
  pcl_ros
  nav_msgs
  livox_ros_driver2
  ackermann_msgs
  yhs_can_msgs
  message_runtime
)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)

################################################
## Declare ROS messages, services and actions ##
################################################

## Declare dependencies to message generation
generate_messages(
  DEPENDENCIES
  std_msgs
  sensor_msgs
  yhs_can_msgs
)

################################################
## catkin specific configuration ##
###########################################
catkin_package(
  CATKIN_DEPENDS roscpp std_msgs sensor_msgs pcl_ros nav_msgs yhs_can_msgs message_runtime
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

## Declare a C++ executable
add_executable(lqrserver src/lqrserver.cpp)

## Add dependencies for message generation
add_dependencies(lqrserver yhs_can_msgs_generate_messages_cpp)  # 确保依赖消息生成

## Link the executable to the necessary libraries
target_link_libraries(lqrserver
  ${catkin_LIBRARIES}
)

#############
## Install ##
#############

## Mark executables for installation
# install(TARGETS lqrserver
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(lqr_circle-test test/test_lqr_circle.cpp)
# if(TARGET lqr_circle-test)
#   target_link_libraries(lqr_circle-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)
