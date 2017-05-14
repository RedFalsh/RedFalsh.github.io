---
title: Raspberry Pi 3——Archlinux系统安装
date: 2017-03-20 21:04:04
tags:
- Raspberry
- Archlinux
- Linux
categories:
- Learn
- Raspberry

---

#  Raspberry Pi 3——Archlinux系统安装

[TOC]
##    国内源网站
[http://mirrors.ustc.edu.cn/](http://mirrors.ustc.edu.cn/)
[http://mirrors.aliyun.com/](http://mirrors.aliyun.com/)
[http://mirrors.163.com/](http://mirrors.163.com/)


##  官网制作sd卡教程
**Note:**
> The Raspberry Pi 3 has higher power requirements than the Raspberry Pi 2. A power supply rated at 2.5A is the official recommendation. Using an insufficient power supply will result in random, inexplicable errors and filesystem corruption.

##  #ARMv7 Installation
This provides the best compatibility with software built around the older revisions of the board, particularly software that requires the vendor libraries.

Replace sdX in the following instructions with the device name for the SD card as it appears on your computer.

1.Start fdisk to partition the SD card:

`fdisk /dev/sdX`

2.At the fdisk prompt, delete old partitions and create a new one:
> a.Type **o**. This will clear out any partitions on the drive.
b.Type **p** to list partitions. There should be no partitions left.
c.Type **n**, then **p** for primary, 1 for the first partition on the drive, press ENTER to accept the default first sector, then type **+100M** for the last sector.
d.Type **t**, then **c** to set the first partition to type W95 FAT32 (LBA).
e.Type **n**, then **p** for primary, 2 for the second partition on the drive, and then press ENTER twice to accept the default first and last sector.
f.Write the partition table and exit by typing **w**.

3.Create and mount the FAT filesystem:

`mkfs.vfat /dev/sdX1`

`mkdir boot`

`mount /dev/sdX1 boot`

4.Create and mount the ext4 filesystem:

`mkfs.ext4 /dev/sdX2`

`mkdir root`

`mount /dev/sdX2 root`

5.Download and extract the root filesystem (as root, not via sudo):
`wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz`
`bsdtar -xpf ArchLinuxARM-rpi-2-latest.tar.gz -C root`
`sync`
6.Move boot files to the first partition:
`mv root/boot/* boot`
7.Unmount the two partitions:
`umount boot root`
8.Insert the SD card into the Raspberry Pi, connect ethernet, and apply 5V power.
9.Use the serial console or SSH to the IP address given to the board by your router.

-  Login as the default user alarm with the password alarm.

- The default root password is root.


##  #AArch64 Installation
This provides an installation using the mainline kernel and U-Boot. There is no support for the vendor-provided libraries, extensions, or related software. Some of the hardware on the board may not work, or it may perform poorly.

Follow the above instructions, substituting with the following tarball:

`http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-3-latest.tar.gz`

[TOC]

##  开始安装

## #基本安装（桌面、用户名、密码等等）
修改源
`vi /etc/pacman.d/mirrorlist`

> `Server = http://mirrors.ustc.edu.cn/archlinuxarm/$arch/$repo`
>
>
>
> 这里一定要注意！！！！！在安装PC版时，大家可能习惯于在上面Server最后写\$arch，但是对于Raspberry Pi、Banana
> Pi这些设备来说，\$arch对应的是armv7h！但是大家可以打开这个网址看一下，只有i686和x86以及any，要是使用\$arch的话在pacman
> -Syy时会404报错！（我就是在这里卡了很久）

**设置root密码：**
`passwd root`
**添加用户：**
`useradd -m -g users -G wheel -s /bin/bash john`
**设置用户密码：**
`passwd john`
**设置主机名称：**
`hostnamectl set-hostname archlinux`
**查看IP：**
`ip addr`
**packer**
`sudo pacman -S packer`
**xorg**
`sudo pacman -S xorg-server xf86-video-fbdev xorg-xrefresh`
**安装xorg工具**
`pacman -S xterm xorg-xclock xorg-twm xorg-xinit xorg-server-utils`
**xfce4**
`sudo pacman -S xfce4 xfce4-goodies xarchiver`
**安装完成重启：**
`reboot`
**登录并进入界面**：
`startxfce4`
**开机启动项**
`cp /etc/X11/xinit/xinitrc ~/.xinitrc`
**时间设置**
`timedatectl set-timezone Asia/Shanghai`


### 常用配置
#### archlinux-wallpaper （壁纸）
`pacman -S archlinux-wallpaper`
[archlinux-wallpaper文件清单](https://www.archlinux.org/packages/community/any/archlinux-wallpaper/files/)
#### openssh (默认只打开用户22端口，root不能访问)
`pacman -S openssh`
`systemctl enable sshd`
`systemctl start sshd`

#### base base-devel（基本软件包）
* 软件包组,这样就不会在编译时缺少 gcc 或者 make 的问题

`pacman -S base base-devel`

#### net-tools dnsutils inetutils iproute2 （网络工具包）
* ifconfig,route在net-tools中，nslookup,dig在dnsutils中，ftp,telnet等在inetutils中,ip命令在iproute2中。

`pacman -S net-tools dnsutils inetutils iproute2`

#### Raspberry Pi 超频
* armfreq：ARM处理器的频率，单位是MHz。默认值是 700。 最简单的方法是将“armfreq”的值改成“900”并加上“sdram_freq=500”。 一步秒杀，十分轻松。

`vi /boot/config.txt`

[TOC]
#### locale（中文配置）
 [参考wiki](https://wiki.archlinux.org/index.php/Arch_Linux_Localization_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#.E5.9F.BA.E6.9C.AC.E4.B8.AD.E6.96.87.E6.94.AF.E6.8C.81)
1. 语言编码设置

`sudo vim /etc/locale.gen`

> en_US.UTF-8 UTF-8
> zh_CN.UTF-8 UTF-8

如前面所说，可以在~/.xinitrc或~/.xprofile单独设置中文locale。添加如下内容到上述文件最前端注释之后（如果不确定使用哪个文件，可以都添加）：

> export LANG=zh_CN.UTF-8
> export LANGUAGE=zh_CN:en_US
> export LC_CTYPE=en_US.UTF-8

2. 安装中文字体
`pacman -S wqy-zenhei`

3. 启用中文locale
Arch Linux中，通过/etc/locale.conf文件设置全局有效的locale：
> LANG=en_US.UTF-8

4. 中文输入法

支持中文输入的常见输入法有scim，fcitx ，ibus。推荐使用ibus，不推荐scim，因为scim已经停止维护了。不过我使用的是scim拼音输入法。

#### wifi安装

`sudo pacman -S networkmanager network-manager-applet`
`systemctl enable NetworkManager`
`systemctl start NetworkManager`
`sudo ifconfig wlan0 up`
`ifconfig wlan0`

check if wlan0 is up
then edit your wireless network in NetworkManage

#### Bluetooth安装

`packer -S yaourt blueman bluez-utils`
`yaourt -S pi-bluetooth`
`systemctl start bluetooth.service`
`systemctl enable bluetooth.service`
`sudo systemctl enable brcm43438.service`
`sudo reboot`

connect bluetooth keyboard：https://wiki.archlinux.org/index.php/bluetooth_keyboard

connect bluetooth headset : https://wiki.archlinux.org/index.php/Bluetooth_headset

If you need to connect a bluetooth headset, then you need install more package

`sudo pacman -Syu pulseaudio-alsa pulseaudio-bluetooth pavucontrol bluez bluez-libs bluez-utils bluez-firmware gstreamer0.10-good-plugins`

#### yaourt源码安装

**1.修改源**

清华大学源
`sudo vim /etc/pacman.conf`

```
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = http://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/any
```

**2.安装package-query**

从archlinux wiki上查找package-query包
`git clone https://aur.archlinux.org/package-query.git`
`cd package-query`
`makepkg`
缺少yajl依赖包，安装
`sudo pacman -S yajl`
重新编译
`makepkg`
编译完成后会在当前目录下生成pkg.tar.xz文件，套件安装：
`sudo pacman -U /home/alan/package-query/package-query-1.6.2-1-armv7h.pkg.tar.xz`
> 注：修改alan为你的用户名，package-query-1.6.2-1-armv7h.pkg.tar.xz版本为生成的版本

**3.安装yaourt**

根据我的上一篇帖子设置好archlinux aur的源地址，直接pacman -S yaourt出了些问题，少了key，pacman-key –init之后卡住不动，所以也手工编译吧。
大体流程和package-query一样，先下载：

`git clone https://aur.archlinux.org/yaourt.git`
`cd yaourt`
编译
`makepkg`
打包
`sudo pacman -U /home/alan/yaourt/yaourt-1.6-1-any.pkg.tar.xz`
> 注意同上package-query安装

#### Python3安装
[python3](https://wiki.archlinux.org/index.php/Python)
`sudo pacman -S python`
**python-setuptools**
`sudo pacman -S python-setuptools`
**python-pip**
`sudo pacman -S python-pip`
**pyqt**
`sudo pacman -S python-pyqt5`
> 相关连接
[QT-wiki](https://wiki.archlinux.org/index.php/Qt#Python_.28PyQt.29)


**python-pyserial**
`sudo pacman -S python-pyserial`
**cxfreeze**
[官方打包说明](http://cx-freeze.readthedocs.io/en/latest/)
`sudo pip install cx_Freeze`

#### udev-设备管理工具
[可参考博客](http://blog.csdn.net/xqf1528399071/article/details/52191637)
[archlinux wiki udev](https://wiki.archlinux.org/index.php/Udev)

1、查询串口号，需安装python-pyserial
`python -m serial.tools.list_ports `
![image_1bagj59nqpe7ov7cq1ben1k799.png-8.9kB][1]

2、根据串口号查询详细信息
`udevadm info /dev/ttyUSB0`
![image_1bagj63sq112quop9cl1f41qiem.png-42.7kB][2]

3、根据这些信息重写串口设备命名规则，采用Linux的udev来自定义规则来管理设备名称

![image_1bagj75lt10jdoe11qmf1o24deh13.png-109.7kB][3]

#### VNC远程桌面--x11vnc
**安装**
`pacman -S x11vnc`
**运行**
首先你需要运行一个x server服务器. 使用startx 或类似的. 完成后运行
**startx**
`x11vnc -display :0 -auth ~/.Xauthority`
如果失败，你可能需要作为root来运行
`x11vnc -display :0 -autho /home/USER/.Xauthority`
**GDM**
作为root, 运行
`x11vnc -display :0 -auth /var/lib/gdm/:0.Xauth`
**访问**
在其他机器运行VNC客户端, 然后输入运行了x11vnc服务器的IP地址. 点击连接, 然后你需要设置.
**SSH端口转发**

为了安全地使用x11vnc，您首先需要安装并且配置好SSH。
在启动x11vnc的时候，指定命令行选项“-localhost”，这将导致VNC服务只能绑定到本地网络界面。此时从外界直接连入的连接将被拒绝。
当您需要从另一台电脑上访问这个VNC服务的时候，首先用SSH登录到运行VNC的主机，将VNC服务监听的端口转发到您的本地主机。以下的例子中假设运行VNC的主机名为"foo"，VNC监听5900端口上：
`ssh foo -L 5900:localhost:5900`
SSH连接建立以后，打开VNC客户端程序，但是不要让它连接到foo的5900端口，而是连接到本机（localhost）的5900端口。
这样，您就可以通过加密渠道安全地访问远程X服务了。

<br><br>
### 装逼命令
`pacman -S screenfetch`
![image_1ba7r0e821e8g1r9g10vmvr21smn1g.png-53.7kB][4]
`yaourt -S oneko`
![image_1ba7rflfr1l03mmvg153ak1gtt34.png-62.5kB][5]
`pacman -S cmatrix`
![image_1ba7qs90678f1fmj1vol1kvj1iknm.png-58.3kB][6]
`pacman -S asciiquarium`
![image_1ba7qrbjj1sccn22e9u19g62ij9.png-20.6kB][7]
`yaourt -S toilet`
![image_1ba7qtoll74i11dp4qq4bm1ig613.png-9.8kB][8]
`pacman -S figlet`
![image_1ba7rc05mbs7vjn1rhk1usf1eb82n.png-7.9kB][9]
`pacman -S sl`
![image_1ba7r3cvo1egrt7e1iv4mkh1i351t.png-18.9kB][10]
`pacman -S cowsay`
![image_1ba7r7lnm7ni139p14rf1mkcm5n2a.png-12.7kB][11]


  [1]: http://static.zybuluo.com/RedFalsh/r04ck73bkixpoqfhh1ugv571/image_1bagj59nqpe7ov7cq1ben1k799.png
  [2]: http://static.zybuluo.com/RedFalsh/pmj4zlutgx0pvlkuyoqamqx4/image_1bagj63sq112quop9cl1f41qiem.png
  [3]: http://static.zybuluo.com/RedFalsh/3comr6jy5lvr6qel8jltbxii/image_1bagj75lt10jdoe11qmf1o24deh13.png
  [4]: http://static.zybuluo.com/RedFalsh/g08qihdsctwapg61cgmf6ksu/image_1ba7r0e821e8g1r9g10vmvr21smn1g.png
  [5]: http://static.zybuluo.com/RedFalsh/kwliam1h87nvu8bx0x5wuoud/image_1ba7rflfr1l03mmvg153ak1gtt34.png
  [6]: http://static.zybuluo.com/RedFalsh/1xwhoss67vynil8633583uq6/image_1ba7qs90678f1fmj1vol1kvj1iknm.png
  [7]: http://static.zybuluo.com/RedFalsh/eaupfk9299vupdzsox37lvcn/image_1ba7qrbjj1sccn22e9u19g62ij9.png
  [8]: http://static.zybuluo.com/RedFalsh/hlvrd5q76dgwao6jsfkxocat/image_1ba7qtoll74i11dp4qq4bm1ig613.png
  [9]: http://static.zybuluo.com/RedFalsh/1eko8kjrnvmno9c714wlnkrt/image_1ba7rc05mbs7vjn1rhk1usf1eb82n.png
  [10]: http://static.zybuluo.com/RedFalsh/2q55h3ufxrs10lcnfyy4lwu1/image_1ba7r3cvo1egrt7e1iv4mkh1i351t.png
  [11]: http://static.zybuluo.com/RedFalsh/4zu1bj8o9ktn7bfabvgy2thf/image_1ba7r7lnm7ni139p14rf1mkcm5n2a.png
