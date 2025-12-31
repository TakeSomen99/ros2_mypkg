#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_mypkg || exit 1
colcon build || exit 1

source install/setup.bash

timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

grep 'DeviceService ready' /tmp/mypkg.log || exit 1

grep 'client' /tmp/mypkg.log || exit 1

echo "test completed"
