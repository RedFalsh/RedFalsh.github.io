---
title: Raspberry Pi 3——noVNC安装测试步骤（web远程vnc访问）
date: 2017-03-20 21:04:04
tags:
- Linux
- Raspberry
- noVNC
- web
categories: 
- Learn
- Raspberry

---

# Raspberry Pi 3——noVNC安装测试步骤（web远程vnc访问）

## 安装novnc
`$sudo apt-get install Git`
`$git clone https://github.com/kanaka/noVNC`
`$cd noVNC`
`$./utils/launch.sh --vnc localhost:5901`
![image_1bboh23un1qn2t271rh2qjg9.png-29.6kB][1]

## 打开浏览器，访问上面URL
![image_1bboh2d4o1nh715qp1oe9qjfkugm.png-355.9kB][2]
连接即可看见树莓派桌面！

## 高级设置
1，修改6080默认端口
`$./utils/websockify --web ./ 8787 localhost:5901`

2,可以讲localhost改成所有安装了vncserver的IP地址，例如：
`$./utils/websockify --web ./ 8787 192.168.1.10:5901`

## 注意
1，vncserver的默认端口一般为5900或5901，具体端口看vncserver安装后给出的端口，比如x11vnc可能为5902

## 问题
2.连接速度太慢，安装numpy可解决，见博客最后；
3.画质不好。
附：安装numpy，解决连接速度慢：
1.在官网上下载该包：http://sourceforge.NET/projects/numpy/files/
2.解压
3.cd进入解压后的路径
4.输入命令
`Python setup.py install`
5.安装完成


  [1]: http://static.zybuluo.com/RedFalsh/2n0bmdottgsjjwddi9vagcnf/image_1bboh23un1qn2t271rh2qjg9.png
  [2]: http://static.zybuluo.com/RedFalsh/dq3xv8j45tdpltf9rz3awoe4/image_1bboh2d4o1nh715qp1oe9qjfkugm.png
