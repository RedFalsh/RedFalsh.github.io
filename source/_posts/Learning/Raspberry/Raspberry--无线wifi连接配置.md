---
title: Raspberry--wifi配置
date: 2017-06-09 13:33:43
tags:
- Raspberry
- Linux
- wifi
categories:
- Learn
- Raspberry

---

# Raspberry--wifi配置

## 配置WiFi连接

* 编辑wifi文件/etc/wpa_supplicant/wpa_supplicant.conf

`sudo nano /etc/wpa_supplicant/wpa_supplicant.conf`

* 在该文件最后添加下面的话
```
network={
  ssid="WIFINAME"
  psk="password"
}
```
> 引号部分分别为wifi的名字和密码
> 保存文件后几秒钟应该就会自动连接到该wifi

* 查看是否连接成功
`ifconfig wlan0`


