---
title: Archlinux-wifi安装配置.md 
date: 2017-03-20 21:04:04
tags: 
- Archlinux
- Linux
categories: 
- Learn
- Archlinux

---

参考链接

* [Wireless network configuration](https://wiki.archlinux.org/index.php/Wireless_network_configuration)
* [wicd](https://wiki.archlinux.org/index.php/Wicd#GTK.2B_client)
* [NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager)

## wicd（轻量级）管理wifi

**安装wicd**
`pacman -S wicd`
**图形界面管理wicd-gtk**
`pacman -S wicd-gtk`
**安装图形界面后启动**
`wicd-client`
**界面：**
![Alt text](/images/wicd-gtk.png)
**连接方式如下图：**
![Alt text](/images/wicd-gtk1.png)

## NetworkManager

### nmcli

启用NetworkManager
* **开机启用 Networ**kManager：
 `systemctl enable NetworkManager`
* **立即启动 Networ**kManager：
 `systemctl start NetworkManager`

命令行前端nmcli包括在networkmanager中。
对于使用信息，参考man nmcli。 例子:
* **连接 WiFi 网络:**
`nmcli dev wifi connect <name> password <password>`
* **通过wlan1接口连接** WiFi 网络:
`nmcli dev wifi connect <name> password <password> iface wlan1 [profile name]`
* **断开一个接口:**
`nmcli dev disconnect iface eth0`
* **重新连接一个标记为已断**开的接口:
`nmcli con up uuid <uuid>`
* **获得 UUID 列表:**
`nmcli con show`
* **查看网络设备及其状态列**表:
`nmcli dev`
* **关闭 WiFi:**
`nmcli r wifi off`
