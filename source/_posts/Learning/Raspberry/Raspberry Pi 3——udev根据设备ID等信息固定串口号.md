---
title: Raspberry Pi 3——udev根据设备ID等信息固定串口号
date: 2017-03-20 21:04:04
tags:
- Raspberry
- udev 
- Linux
categories: 
- Learn
- Raspberry

---

# Raspberry Pi 3——udev根据设备ID等信息固定串口号

查询串口号
---

`python -m serial.tools.list_ports  `
![image_1bboj17b01i2964c2q21q8s6se9.png-9kB][1]
列出串口详细信息
---

`udevadm info /dev/ttyUSB0  `
 ![image_1bboj1dc6pvpaodahh14n63jfm.png-42.7kB][2]
根据这些信息重写串口设备命名规则，采用Linux的udev来自定义规则来管理设备名称
 ![image_1bboj1jf5dkm1e6797k1itd8ne13.png-113.8kB][3]

添加修改规则文件
---

`sudo vi /etc/udev/rules.d/98-com.rules`
如98-com.rules文件，根据串口信息

    E: ID_SERIAL_SHORT=FTH7R3JS
    E: SUBSYSTEM=tty

 
修改里面内容为下面
 

    SUBSYSTEM=="tty",
    ENV{ID_SERIAL_SHORT}=="A1051JVT",
    SYMLINK+="ttyUSBname"#这里为自定义的串口名字

 ![image_1bboj1qmvcg2l0upl515jo14ud1g.png-10.6kB][4]
注意：这里自定义名称不能跟原来的ttyUSB0等之类的相同，不然会错误的！！！！！！
 
参考网址：http://superuser.com/questions/536478/how-to-lock-device-ids-to-port-addresses
 


  [1]: http://static.zybuluo.com/RedFalsh/eil0ejhgzmi8kkxl2tqbvjln/image_1bboj17b01i2964c2q21q8s6se9.png
  [2]: http://static.zybuluo.com/RedFalsh/nwdw8cps6n7z7bzgugis5jaq/image_1bboj1dc6pvpaodahh14n63jfm.png
  [3]: http://static.zybuluo.com/RedFalsh/djudfgjzqhw6hnc593b3k44q/image_1bboj1jf5dkm1e6797k1itd8ne13.png
  [4]: http://static.zybuluo.com/RedFalsh/6b0uw1rb6p0tnqplzpymbs2u/image_1bboj1qmvcg2l0upl515jo14ud1g.png