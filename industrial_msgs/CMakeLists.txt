cmake_minimum_required(VERSION 3.5)

project(industrial_msgs)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(trajectory_msgs REQUIRED)
find_package(std_msgs REQUIRED)

set(msg_files
  "msg/DebugLevel.msg"
  "msg/DeviceInfo.msg"
  "msg/RobotMode.msg"
  "msg/RobotStatus.msg"
  "msg/ServiceReturnCode.msg"
  "msg/TriState.msg"
  )

set(srv_files
  "srv/CmdJointTrajectory.srv"
  "srv/GetRobotInfo.srv"
  "srv/SetDrivePower.srv"
  "srv/SetRemoteLoggerLevel.srv"
  "srv/StartMotion.srv"
  "srv/StopMotion.srv"
 )

rosidl_generate_interfaces(${PROJECT_NAME}
        ${srv_files}
        ${msg_files}
        DEPENDENCIES std_msgs trajectory_msgs
        ADD_LINTER_TESTS
        )

ament_export_dependencies(rosidl_default_runtime)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()


ament_package()


