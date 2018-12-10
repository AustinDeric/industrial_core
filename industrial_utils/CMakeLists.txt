cmake_minimum_required(VERSION 3.5)

project(industrial_utils)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(urdf REQUIRED)

include_directories(
  include
  ${rclcpp_INCLUDE_DIRS})

add_library(${PROJECT_NAME} SHARED src/utils.cpp src/param_utils.cpp)

target_link_libraries(${PROJECT_NAME}
  ${rclcpp_INCLUDE_DIRS}
  ${urdf_INCLUDE_DIRS})


install(TARGETS
  ${PROJECT_NAME} 
  LIBRARY DESTINATION lib)

install(DIRECTORY include/
  DESTINATION include
)

if(BUILD_TESTING)
    find_package(ament_lint_auto REQUIRED)
    find_package(ament_cmake_gtest REQUIRED)
    ament_add_gtest(utest_inds_utils test/utest.cpp)
    target_link_libraries(utest_inds_utils ${PROJECT_NAME} ${rclcpp_LIBRARIES})
    ament_lint_auto_find_test_dependencies()
endif()

ament_export_dependencies(urdf)
ament_export_include_directories(include)
ament_export_libraries(tf2)
ament_package()