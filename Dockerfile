FROM osrf/ros2:bouncy-ros-base

RUN apt-get update && apt-get install -y \
  python3-colcon-common-extensions \
  python-rosdep \
  git

RUN rosdep init && rosdep update

RUN mkdir -p /ros2_ws/src/

WORKDIR /ros2_ws/src/

RUN git clone https://github.com/ament/ament_lint.git
RUN git clone https://github.com/ament/ament_cmake.git
RUN git clone -b bouncy https://github.com/ament/ament_package.git
RUN git clone -b ros2 https://github.com/ament/googletest.git

WORKDIR /ros2_ws/

RUN rosdep install --from-paths src --ignore-src -r -y
RUN colcon build --symlink-install

