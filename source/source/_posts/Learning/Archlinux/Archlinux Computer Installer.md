---
title: Archlinux系统——初始安装
date: 2017-03-20 21:04:04
tags:
- Archlinux
- Linux
categories:
- Learn
- Archlinux

---

# Archlinux Computer Installer


## 基本安装教程
[参考--系统搭建过程](https://github.com/RedFalsh/Wiki/wiki/archlinux-xfce4)


### 设置ssh远程访问（root）
**修改ssh配置文件**
`nano /etc/ssh/sshd_config`
```
PermitRootLogin yes
PermitEmptyPasswords yes
```
**启动ssh**
`systemctl start sshd`

### 磁盘查看、分区、挂载

* 查看磁盘：
`fdisk -l`

* 磁盘分区：
`cfdisk /dev/sda`
> dos
> /dev/sda1  1G   linux boot
> /dev/sda2  2G   linux swap /solaris
> /dev/sda3  37G  linux


* 查看分区：
`fdisk -l`
`mkfs.ext4 /dev/sda1`
`mkswap /dev/sda2`
`swapon /dev/sda2`
`mkfs.ext4 /dev/sda3`

* 挂载：
`mount /dev/sda3 /mnt`
`mkdir /mnt/boot /mnt/var mnt/home`
`mount /dev/sda1 /mnt/boot`

### 修改国内镜像源、安装基本系统包、更新内核

* 修改国内镜像源：
`nano /etc/pacman.d/mirrorlist`
> 添加以下内容：
> `Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch`
> `Server = http://mirrors.163.com/archlinux/$repo/os/$arch`

* 安装基本系统:
`pacstrap /mnt base base-devel`

* 更新内核：
`pacman -Syu`

### 安装引导工具grub、生成fstab

* 安装引导工具grub:
`pacstrap /mnt grub-bios`

* 生成fstab:
`genfstab -p /mnt >> /mnt/etc/fstab`

* 转回到主目录:
`arch-chroot /mnt`

### 时钟配置、修改root密码、用户添加：

* 时钟配置
`hwclock --systohc --utc`

* 创建初始内存盘:
`mkinitcpio -p linux`
> [mkinitcpio参考](https://wiki.archlinux.org/index.php/Mkinitcpio_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

* 设置root密码：
`passwd root`

* 添加用户：
`useradd -m -g users -G wheel -s /bin/bash john`

* 设置用户密码：
`passwd john`

* 安装到磁盘上
`grub-install /dev/sda`
`grub-mkconfig -o /boot/grub/grub.cfg`
> [grub参考](https://wiki.archlinux.org/index.php/GRUB_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

* 退出：
`exit`

* 重启：
`reboot`

* 登录root：
`root`

* 设置主机名称：
`hostnamectl set-hostname archlinux`

* 查看IP：
`ip addr `

* 打开dhcpcd
`systemctl enable dhcpcd`
`systemctl start dhcpcd`
`ping www.google.com`

* 允许用户：
`nano /etc/sudoers`
> root ALL=(ALL) ALL
> john ALL=(ALL) ALL

### xorg 桌面环境安装
* 参考
[xorg参考](https://wiki.archlinux.org/index.php/Xorg)
* 安装：
`pacman -S xorg`
* 安装xorg工具：
`pacman -S xterm xorg-xclock xorg-twm xorg-xinit xorg-server-utils`

## 桌面安装

### xfce4

* 安装xfce4：
`pacman -S xfce4`

* 安装完成重启：
`reboot`

* 登录并进入界面：
`startxfce4`

### 安装KDE-plasma桌面
* 参考
[KDE-wiki](https://wiki.archlinux.org/index.php/KDE)
* 安装
`pacman -S plasma kdebase`
`pacman -R plasma-mediacenter`
`pacman -S ttf-freefont`
`systemctl enable sddm`
`reboot`
## Arch Linux 中文社区仓库 / 镜像加速源
[修改源说明链接](https://www.archlinuxcn.org/archlinux-cn-repo-and-mirror/)
[http://repo.archlinuxcn.org/](http://repo.archlinuxcn.org/)
[https://mirrors.ustc.edu.cn/archlinuxcn/](https://mirrors.ustc.edu.cn/archlinuxcn/)
```
# Global CDN (no nodes in mainland China)
[archlinuxcn]
Server = https://cdn.repo.archlinuxcn.org/$arch
# TUNA mirror of Tsinghua University
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch#  both IPv4 & IPv6
# Server = https://mirrors.6.tuna.tsinghua.edu.cn/archlinuxcn/$arch#  only IPv6
# Server = https://mirrors.4.tuna.tsinghua.edu.cn/archlinuxcn/$arch#  only IPv4
# HTTP is also supported
# University of Science and Technology of China
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
# or with HTTP
# Server = http://mirrors.ustc.edu.cn/archlinuxcn/$arch
# 上海科技大学 Geek Pie 社团
[archlinuxcn]
Server = https://mirrors.geekpie.org/archlinuxcn/$arch
# 中国科学院开源软件协会（OpenCAS）
[archlinuxcn]
Server = http://mirrors.opencas.org/archlinuxcn/$arch
# Netease (网易)
[archlinuxcn]
Server = http://mirrors.163.com/archlinux-cn/$arch
# 电子科技大学 凝聚网络安全工作室
[archlinuxcn]
Server = http://mirrors.cnssuestc.org/archlinuxcn/$arch
# Chongqing University Open Source Mirror Site
[archlinuxcn]
Server = http://mirrors.cqu.edu.cn/archlinux-cn/$arch
```
### yaourt ---AUR包安装工具
* 参考
* Arch Linux 中文社区仓库 是由 Arch Linux 中文社区驱动的非官方用户仓库。包含中文用户常用软件、工具、字体/美化包等。

完整的包信息列表（包名称/架构/维护者/状态）请 [点击这里](https://github.com/archlinuxcn/repo)
 查看。
* 修改aur源
`sudo nano /etc/pacman.conf`

* 添加
```
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://cdn.repo.archlinuxcn.org/$arch
```
* 安装

`sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring`


## 其他常用安装说明

### slim安装----图形登录界面
* 参考
[slim wiki](https://wiki.archlinux.org/index.php/SLiM)
* 安装
`pacman -S slim slim-themes archlinux-themes-slim xdg-user-dirs`
`pacman -S systemctl enable slim.service`
`pwd`
`cp /etc/X11/xinit/xinitrc ~/.xinitrc`

* 修改启动文件
`nano .xinitrc`
> twn &
> ...
> ...
> ..
> exec xfce4-session

* 修改slim配置，更换登录主题：
`nano /etc/slim.conf`
> current_theme archlinux-soft-grey

**注：安装完成后只能登录root，不知道为什么不能登录用户**





### ifconfig ---网络查询工具
`pacman -S net-tools dnsutils inetutils iproute2`

### openssh ---远程登录工具
* 参考
[openssh wiki 链接](https://wiki.archlinux.org/index.php/Secure_Shell)
* 安装
`sudo pacman -S openssh`
`systemctl enable sshd`
`systemctl start sshd`

### numix----美化系统图标:
* 安装
`pacman -S numix-themes`
`yaourt -S numix-circle`

### cairo-dock----3D特效图标托盘
* 参考
[wiki 链接](https://wiki.archlinux.org/index.php/Cairo-Dock)
* 安装
`pacman -S cairo-dock`
* 特效插件安装
`pacman -S cairo-dock-plug-ins`

### compiz----3d特效装逼桌面
* 参考
[compiz wiki](https://wiki.archlinux.org/index.php/Compiz)
* 安装compiz-opengl特效
`yaourt compiz`
安装窗口装饰器emerald0.9以及主题emerald-themes
`yaourt emerald`


### conky----cpu、内存、天气等图形化显示
* 参考
[Conky wiki](https://wiki.archlinux.org/index.php/Conky)
* 安装conky-manager
`pacman -S conky-manager`

### cmd markdown----作业部落-markdown编辑工具
 [cmd markdown 包](https://aur.archlinux.org/packages/cmd-markdown/)
 * 安装
 `yaourt cmd-markdown`

### Local-Systemd----rc.local开机启动服务自定义
* 参考
[rc-local wiki](https://wiki.archlinux.org/index.php/User:Herodotus/Rc-Local-Systemd)

### wifi------无线网络
* 参考
[wiki](https://wiki.archlinux.org/index.php/Wireless_network_configuration_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#.E8.AE.BE.E5.A4.87.E9.A9.B1.E5.8A.A8)
* 工具
[NetworkManager----检测网络、自动连接网络的程序](https://wiki.archlinux.org/index.php/NetworkManager)
[Wicd----是 NetworkManager 的一个功能相似的替代](https://wiki.archlinux.org/index.php/Wicd_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#.E5.9F.BA.E7.A1.80.E8.BD.AF.E4.BB.B6.E5.8C.85)
### wps-office------办公软件
* 参考
[wiki](https://wiki.archlinux.org/index.php/WPS_Office_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#.E5.AE.89.E8.A3.85)
* 安装
64位
`pacman -S wps-office`
32位
`yaourt wps-office`


