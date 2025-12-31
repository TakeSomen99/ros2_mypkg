# ros2_mypkg
raspberrypiを含むUSB付きシングルボードコンピュータに接続されている外部デバイスを一目で分かる様に出力します。


![Static Badge](https://img.shields.io/badge/python-blue)

## 動作環境
+ Ubuntu: 24.04 LTS
+ Python: 3.12.3

## 使用方法
ELECOM製UVC WEBカメラ UCAM-CC310FBBKをRaspberry Pi 3BのUSB2.0ポートへつないだ時の出力を例とします。
```bash
$ git clone https://github.com/TakeSomen99/ros2_mypkg.git
$ cd ~/ros2_mypkg
$ ros2 launch mypkg talk_listen.launch.py
[INFO] [launch]: All log files can be found below /home/ubuntu/.ros/log/2025-12-31-22-06-41-492142-raspberrypi-9802
[INFO] [launch]: Default logging verbosity is set to INFO
[INFO] [server-1]: process started with pid [9805]
[INFO] [client-2]: process started with pid [9806]
[server-1] [INFO] [1767186405.732563583] [device_server]: DeviceService ready. Waiting...
[client-2] ['ELECOM_1MP_Webcam']
[INFO] [client-2]: process has finished cleanly [pid 9806]
``` 



## ライセンス
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- © 2025 TakeSomen99
