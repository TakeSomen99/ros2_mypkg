#!/usr/bin/env bash
set -e

WS_DIR=$(cd "$(dirname "$0")/../.." && pwd)
cd "$WS_DIR"

echo "[1] colcon build"
colcon build --packages-select device_msgs mypkg
source install/setup.bash

echo "[2] launch smoke test"
timeout 5 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log 2>&1 || true

echo "[3] check launch error"
if grep -Ei "error|traceback|failed" /tmp/mypkg.log; then
  echo "Launch failed"
  exit 1
fi

echo "test was completed!!!"
