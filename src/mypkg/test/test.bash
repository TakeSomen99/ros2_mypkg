#!/usr/bin/env bash
set -

WS_DIR=$(cd "$(dirname "$0")/../.." && pwd)
cd "$WS_DIR"

echo "[1] colcon build"
colcon build --packages-select device_msgs mypkg
source install/setup.bash

echo "[2] launch test"
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

grep 'ELECOM' /tmp/mypkg.log

echo "test was completed!!!"

