#!/usr/bin/env bash
set -euo pipefail

echo "=== ROS2 integration test start ==="

WS=~/ros2_ws
mkdir -p $WS/src
cp -r . $WS/src/ros2_mypkg

cd $WS

echo "[1] colcon build"
colcon build --packages-select device_msgs mypkg

source install/setup.bash

echo "[2] launch test"
timeout 10 ros2 launch mypkg talk_listen.launch.py > launch.log 2>&1 &

sleep 3

echo "[3] service existence test"
ros2 service list | grep get_device_names

echo "[4] service call test"
ros2 service call /get_device_names device_msgs/srv/Device "{}" \
  | grep "\["

echo "=== ROS2 integration test SUCCESS ==="

