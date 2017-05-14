---
title: Gentoo安装过程记录
date: 2017-03-21 14:05:11
tags: 
- Gentoo 
- Linux
categories: 
- Learn 
- Gentoo

---


# Gentoo安装过程记录

[TOC]

##  下载

[下载链接](https://www.gentoo.org/downloads/)
下载iso文件
![image_1bafg46s9cn3cbopful601kf9.png-145.4kB][1]

## 安装和配置
[博客参考1](https://www.futures.moe/writings/install-gentoo-on-raspberry-pi-2.htm)
[博客参考2](https://wiki.jmk.hu/wiki/Raspberry_Pi_Gentoo_Linux_Installation)
[博客参考3](https://blog.ramses-pyramidenbau.de/?p=188)
[wiki参考4](https://wiki.gentoo.org/wiki/Raspberry_Pi/Quick_Install_Guide#Preparing_the_SD_card)
[wiki参考5](https://wiki.gentoo.org/wiki/Raspberry_Pi)


## Emerge详细解释
[Portage入门](http://blog.csdn.net/junmuzi/article/details/8944848)
[Emerge详细解释](http://www.cnblogs.com/huqingyu/archive/2006/04/07/368870.html)
[emerge 中文手册](http://www.jinbuguo.com/gentoo/emerge.html)

* 安装指定版本的包
`emerge =dev-lang/python2.7.13`
* 安装高版本的包,需要用转义符
`emerge \>=dev-lang/python2.7.13`

## layman安装(第三方源)
[Layman-Installation](https://wiki.gentoo.org/wiki/Layman#Installation)
[layman-wiki](https://wiki.gentoo.org/wiki/Layman)
[gentoo-第三方软件包搜索](http://gpo.zugaina.org/dev-lang/python/USE#ptabs)

* 安装layman
`emerge --search layman`
`emerge --ask app-portage/layman`

* 修改配置文件
    1. `repos.conf` 方式 (默认)
        * 修改配置文件`/etc/layman/layman.cfg`
        `nano /etc/layman/layman.cfg`
            > conf_type : repos.conf
    
        * 如果不存在，则创建`/etc/portage/repos.conf`文件夹
        `mkdir /etc/portage/repos.conf`
    
        * 如果layman安装版本>=layman-2.3.0，可以用以下命令生成` repos.conf `文件
        `layman-updater -R`
    2. `make.conf` 方式 (老方法)
        * 修改配置文件`/etc/layman/layman.cfg`
        `nano /etc/layman/layman.cfg`
        > conf_type : repos.conf
        * 添加下面至/etc/portage/make.conf
        `source /var/lib/layman/make.conf  `
        `PORTDIR_OVERLAY="${PORTDIR} ${PORTDIR_OVERLAY}"  `

### emerge 常见问题汇总

#### 需要修改包的USE标记

在安装某个包时出现如下情况：
![image_1bb99d3fj1gs4qdanq319291rg09.png-36.6kB][2]
大体意思是说：安装`net-lib/nodejs`包时有两个依赖包需要在/etc/portage/package.use中设置USE变量`>=dev-lib/openssl-1.0.2k -bindist`
![image_1bb99gg5g1ctg18eir0ota31kk6m.png-21.8kB][3]
##sudo
1、安装app-admin/sudo
`su  `
`emerge sudo  `

2、设置环境变量EDITOR
`echo EDITOR=\"/usr/bin/vim\" >/etc/env.d/99editor ` 
`env-update  `
然后注销重新登陆
3、编辑sudo配置文件/etc/sudoer，启用wheel组特权，/etc/sudoer不能用编辑器直接编辑，只能使用visudo命令调用编辑器编辑
`su  `
`visudo  `
去掉这两行的注释   
```
#%wheel ALL=(ALL) ALL  
  
#%wheel ALL=(ALL) NOPASSWD: ALL  
```
4、将你的用户加入wheel组

`gpasswd -a your_user_name wheel`
然后注销重新登陆
**参考文档：**
[《Gentoo Sudo(ers) Guide》](https://wiki.gentoo.org/wiki/Sudo#Installation)

## Gentoo本地化设置--时区、时钟、字体、中文环境

* 可参考
[Arch Linux Localization (简体中文)](https://wiki.archlinux.org/index.php/Arch_Linux_Localization_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#.E7.BB.88.E7.AB.AF.E4.B8.AD.E6.96.87.E6.94.AF.E6.8C.81)
[Gentoo本地化设置](http://www.jianshu.com/p/9411ab947f96)

你需要选择时区让系统知道你的地理位置，以保持正确的时间。在/usr/share/zoneinfo中查找你的时区。然后在/etc/conf.d/clock中设置时区。请忽略/usr/share/zoneinfo/Etc/GMT*时区，因为它们的名字并不表示所指的地区。比如，GMT-8实际上是GMT+8。
设置时区信息：

`ls /usr/share/zoneinfo`
`echo "Asia/Shanghai" > /etc/timezone`
`emerge --config sys-libs/timezone-data`

> 注意:
> 你可以做一个用户级的设置，在shell的rc文件（如bash的.bash_profile）中将TZ变量的值设为/usr/share/zoneinfo下的任何东西。本案例中TZ="Asia/Shanghai"。

**硬件时钟**

Gentoo Linux安装过程中，大多数情况下硬件时钟都是被设成UTC（或GMT，格林威治标准时间），而时区则定为实际的本地时间。如果出于某种原因，你需要将硬件时钟设为非UTC，那么你就要编辑/etc/conf.d/hwclock，将CLOCK的值由UTC改为local。
`CLOCK="UTC"`
或
`CLOCK="local"`

**安装中文字体**

推荐开源文泉驿自由字体（选择一个字体安装）
`emerge wqy-zenhei` （文泉驿正黑）
`emerge wqy-microhei` （文泉驿微米黑）

**生成指定的Locale**
可能你在系统中只要用到一个或者两个locale。你可以在/etc/locale.gen中指定所需的的locale。
中文有很多种编码，最流行的就是UTF8和GBK。我们推荐客户使用UTF8编码，因为这是国际标准，能兼容任何语言的编码。

* 添加locale到`/etc/locale.gen`
`nano -w /etc/locale.gen`
> en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8

* 执行`locale-gen`。它会生成/etc/locale.gen文件中指定的所有locale。
* 你可以通过执行`locale -a`来检验所选的locale是否可用。

**设置一个Locale显示中文**

* 通过/etc/locale.conf文件设置全局有效的locale：
`LANG=en_US.UTF-8`

> 警告: 不推荐在此设置中文locale，会导致tty乱码；在tty下亦可显示和输入中文，但需要安装cce、zhcon或fbterm；

* 在/etc/env.d/02locale（可以自己创建02locale文件）中设置全局默认的系统locale
> LANG="zh_CN.UTF-8" 
LC_COLLATE="C"

* 在~/.bashrc中设置用户级的系统locale
> export LANG="zh_CN.UTF-8" 
export LC_COLLATE="C"

* 更新系统全局默认的locale：
设置好正确的locale后，一定要更新环境变量使系统知道所做的更改：
`env-update && source /etc/profile`

* 更新特定用户的locale：
`source ~/.bashrc`

现在，检验一下所做的更改是否已经生效了：
`locale`

> 注：另一种系统配置方式是保留默认的C locale，同时要能够表现UTF-8字符。
> 这种选择可以通过使用下述设置来实现：LC_CTYPE=zh_CN.UTF-8


## WPS安装
[wps-gentoo-wiki](http://community.wps.cn/wiki/Gentoo_ebuild_%E4%BB%A5%E5%8F%8A%E5%AE%89%E8%A3%85%E6%AD%A5%E9%AA%A4)

## python
### [pip](https://pypi.python.org/pypi)(必须安装)
`wget https://pypi.python.org/packages/source/p/pip/pip-x.x.x.tar.gz`
`tar -zxvf pip-x.x.x.tar.gz`
`python3 setup.py build`
`python3 setup.py install`



### [setuptools](https://pypi.python.org/pypi)（必须安装）
`wget https://pypi.python.org/packages/source/s/setuptools/setuptools-xx.xx.tar.gz`
`tar -zxvf setuptools-xx.xx.tar.gz`
`cd setuptools-19.6`
`python3 setup.py build`
`python3 setup.py install`

## [NodeJS nginx monit](https://wiki.gentoo.org/wiki/NodeJS)

# gentoo install in vmware
[参考wiki](https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Base#Chrooting)
[参考wiki2](https://wiki.gentoo.org/wiki/Handbook:X86/Full/Installation/zh-cn#.E7.A1.AC.E4.BB.B6.E9.9C.80.E6.B1.82)

## 分区硬盘和挂载

`whoami`

`sudo su `
`cd `
`gparted`

> 1G boot ext4 
2G linux swap 
38G linux
`mkswap /dev/sda2`
`swapon /dev/sda2`
`mount /dev/sda3 /mnt/gentoo/`
`mkdir /mnt/gentoo/boot`
`mount /dev/sda1 /mnt/gentoo/boot`

## 下载和提取 stage 3 image

`ping www.baidu/com`
`links http://www.gentoo.org/main/en/mirrors.xml`
`amd64/autobuilds/current-stage3-amd64/`
`pwd` 
`tar xvjpf stage3-amd64-20160818.tar.bz2 -C /mnt/gentoo/`
`cp -L /etc/resolv.conf /mnt/gentoo/etc`
`mount -t proc /proc /mnt/gentoo/proc `
`mount --rbind /sys /mnt/gentoo/sys`
`mount --rbind /dev /mnt/gentoo/dev`

## Entering the new environment

`pwd`
`cd /mnt/gentoo/`
`chroot /mnt/gentoo /bin/bash`
`source /etc/profile`
`export PS1="(chroot) $PS1"`
`mkdir /usr/portage`

## 添加国内源

`nano /etc/make.conf`

```GENTOO_MIRRORS=http://mirrors.163.com/gentoo/```

## 安装基本系统
`emerge-webrsync`
`emerge --sync`


## 选择平台
`eselect profile list` 
`eselect profile set 1`

## 修改时区
`ls /usr/share/zoneinfo`
`ls /usr/share/zoneinfo/America`
`cp /usr/share/zoneinfo/America/Toronto /etc/localtime`
`echo "America/Toronto" > /etc/timezone`
`nano /etc/locale.gen`
`en_US`
`zh_CN`
`locale-gen`
`env-update && source /etc/profile`
## 内核编译
`emerge gentoo-sources`
`emerge genkernel`
`genkernel all`
## 修改主机名
`hostname`
`nano /etc/conf.d/hostname `
`hostname = "gentoo2017"`
`nano /etc/hosts`
```
127.0.0.1  gentoo2017 localhost
```
`hostname gentoo2017`
`hostname`
## 修改文件启动fstab
`nano /etc/fstab`
```
/dev/sha1   /boot   ext4        defaults,noatime    me   0 2
/dev/sda3   /       ext4        noatime         0 1
/dev/sda2   none    swap        sw              0 0
#/dev
#/dev
```
## 安装常用工具dhcpcd、ssh等等......
`emerge dhcpcd`
`rc-update add dhcpcd default`
`emerge ssh `
`rc-update add sshd default`
`emerge syslog-ng`
`rc-update add syslog-ng default`
`emerge mlocate`
`emerge cronie`
`rc-update add cronie default`
`emerge sudo`
`whoami`
`passwd`

## 添加用户
`useradd -m G users.cdrom,portage,cron -s /bin/bash john`
`passwd john`
`nano /etc/sudoers`

```
root ALL=(ALL) ALL
john ALL=(ALL) ALL
```

`emerge grub`
`grub-install /dev/sda`
`grub-mkconfig -o /boot/grub/grub.cfg`
`cat /boot/grub/grub.cfg`
`emerge open-vm-tools`
`emerge --ask --autounmask-write open-vm-tools`
`dispatch-conf`
`u`
`emerge open-vm-tools`
`rc-update add vmware-tools default`
`cd`
`pwd`
`exit`
`umount -l /mnt/gentoo/dev/shm `
`umount -l /mnt/gentoo/dev/pts `
`umount -l /mnt/gentoo/dev/boot`
`umount -l /mnt/gentoo/dev/proc`
`reboot`

`root`
`hostname`
`ping www.baidu.com`
`rc-status default`


```
# 
# dispatch-conf.conf 
#  
# Directory to archive replaced configs archive-dir=/etc/config-archive  
# Use rcs for storing files in the archive directory? 
# (yes or no) use-rcs=yes  
# Diff for display diff="diff -Nau %s %s"  
# Pager for diff display pager="less --no-init --QUIT-AT-EOF"  
# Automerge files comprising only CVS interpolations (e.g. Header or Id) 
# (yes or no) 
replace-cvs=yes  
# Automerge files comprising only whitespace and/or comments 
# (yes or no) 
replace-wscomments=yes  
# Automerge files that the user hasn't modified 
# (yes or no) 
replace-unmodified=yes
```

# gentoot install small
## ssh远程配置
`F1`
`gentoo`
`ping -c 3 www.baidu.com`
`ifconfig`
查看是否有ip地址可连接
```
eno16777736: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.73.130  netmask 255.255.255.0  broadcast 192.168.73.255
        inet6 fe80::20c:29ff:fed0:6b26  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:d0:6b:26  txqueuelen 1000  (Ethernet)
        RX packets 2209  bytes 163898 (160.0 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 266  bytes 37312 (36.4 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
查询失败做如下操作
```
输入ifconfig查看网卡信息
        如果这里只能看到Net.lo一块网卡，无法配置IP地址
        解决方法：cd /etc/init.d
                              ln -s net.lo net.enp2s1
                              #rc-update add net.enp2s1 default(这里不需要)
04、配置IP地址，如果可以获取IP地址，则不需要以下操作
        ifconfig enp2s1 192.168.254.130 netmask 255.255.255.0 up
        route add default gw 192.168.254.2
        nano -w /etc/resolv.conf
        nameserver 192.168.254.2
```     
   
修改root密码
`passwd`
启动ssh
`/etc/init.d/sshd start`
远程连接开始安装

##准备磁盘
**使用fdisk对磁盘进行分区**
**Note**
虽然最近的fdisk 应该也支持GPT, 但它仍然有一些问题。下面给出的指导假定我们的分区方案使用的是MBR。
下面的部分解释了怎样使用fdisk来创建范例分区布局，范例分区布局我们在前面已经提到过了。

**Partition	Description**
/dev/sda1	BIOS boot partition
/dev/sda2	Boot partition
/dev/sda3	Swap partition
/dev/sda4	Root partition
请您根据自己的实际需要来调整您的分区布局。
**查看当前分区布局**
fdisk是一个流行的和强大的分区工具。用fdisk向磁盘开火吧！（在我们的例子里，我们使用/dev/sda）:
`fdisk /dev/sda`
制作成如下：
```
   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1         3      5198+  ef  EFI (FAT-12/16/32)
/dev/sda2   *         3        14    105808+  83  Linux
/dev/sda3            15        81    506520   82  Linux swap
/dev/sda4            82      3876  28690200   83  Linux
```
在示例分区结构中，有 使用ext2的引导分区（/dev/sda2）和使用ext4的根分区（/dev/sda4），下面的命令将会用到：
`mkfs.ext2 /dev/sda2 `
`mkfs.ext4 /dev/sda4`
**激活swap分区**
`mkswap /dev/sda3`
`mkswap /dev/sda3`
**挂载**
现在分区都已初始化并有文件系统，接下来该挂载那些分区了。使用mount命令，但是不要忘记为每一个创建的分区创建需要的挂载目录。比如示例中我们挂载根 和引导 分区:
`mount /dev/sda4 /mnt/gentoo`
`mkdir /mnt/gentoo/boot`
`mount /dev/sda2 /mnt/gentoo/boot`


  [1]: http://static.zybuluo.com/RedFalsh/zbvycsprtqajo4dlmbw2dde2/image_1bafg46s9cn3cbopful601kf9.png
  [2]: http://static.zybuluo.com/RedFalsh/rl1b7nwsish39hrtg7w58y50/image_1bb99d3fj1gs4qdanq319291rg09.png
  [3]: http://static.zybuluo.com/RedFalsh/8ptrtuay2k8fekib1pykossh/image_1bb99gg5g1ctg18eir0ota31kk6m.png