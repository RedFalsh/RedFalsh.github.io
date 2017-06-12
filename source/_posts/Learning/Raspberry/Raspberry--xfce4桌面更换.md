---
title: Raspberry--xfce4桌面
date: 2017-06-08 15:21:17
tags:
- Raspberry
- Linux
- Gate One
- web
categories:
- Learn
- Raspberry

---

# Raspberry--xfce4桌面

## 安装xfce4桌面

`sudo apt-get install xfce4`

## 配置开机启动桌面

`sudo update-alternatives --config x-session-manager`

这里会弹出选择启动项目，六七个左右

|   |   |   |   |
|:--|:--|:--|:--|
|selection|path|priority|status|
|0|/usr/bin/startlxde-pi|90|auto mode|
|1|......|..|....|
|2|......|..|....|
|3|......|..|....|
|4|......|..|....|
|5|......|..|....|
|6|......|..|....|

## 重启

`sudo reboot`
