---
title: Raspberry Pi 3——修改软件源
date: 2017-03-20 21:04:04
tags:
- Raspberry
- Linux
- Raspbian
categories: 
- Learn
- Raspberry

---
# Raspberry Pi 3——修改软件源

## 前言
本文说明如何修改树莓派软件源。如果使用raspbian系统，修改软件源的方法和ubuntu相同，可在http://www.raspbian.org找到最新的软件源镜像，修改/etc/apt/sources文件中的内容即可。

## 修改sources.list
* 备份
在修改之前先把源列表备份，然后再修改sources.list
`cd /etc/apt`
`cp sources.list sources.list_back`
* 修改
`sudo nano sources.list`
例如使用大连东软信息学院软件源镜像，修改之后的内容如下：
* wheezy版本
deb http://mirrors.neusoft.edu.cn/raspbian/raspbian wheezy main contrib non-free rpi 
* jessie版本
deb http://mirrors.neusoft.edu.cn/raspbian/raspbian jessie main contrib non-free rpi

    
## 更新软件源和软件
* 更新软件源
`sudo apt-get update`
* 更新软件
`sudo apt-get upgrade`

## 参考
[树莓派学习笔记](http://blog.csdn.net/xukai871105/article/details/23115627)


