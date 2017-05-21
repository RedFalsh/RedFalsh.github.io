---
title: Raspberry Pi 3——VNC远程桌面操作
date: 2017-03-20 21:04:04
tags:
- Raspberry
- VNC 
- Linux
categories: 
- Learn
- Raspberry

---

# Raspberry Pi 3——VNC远程桌面操作

 
## 方法1
 
安装VNC需要使用命令行。如果需要远程操作安装VNC，就必须通过SSH登录到命令行界面。
### 安装
树莓派命令行：
`sudo apt-get install tightvncserver`
安装好之后请一定先使用此命令设置一个VNC密码：
`vncpasswd`
（先输入操作密码两次，然后会询问是否设置一个查看(view-only)密码，按自己喜欢，一般没必要。）

### 开机自动启动
设置开机启动，需要在/etc/init.d/中创建一个文件。例如tightvncserver：
（注：启动脚本的名称，有和程序名一致的习惯）
`sudo nano /etc/init.d/tightvncserver`
内容如下：（putty窗口中按右键=粘贴）#!/bin/sh

    #!/bin/sh
    ### BEGIN INIT INFO
    # Provides:          tightvncserver
    # Required-Start:    $local_fs
    # Required-Stop:     $local_fs
    # Default-Start:     2 3 4 5
    # Default-Stop:      0 1 6
    # Short-Description: Start/stop tightvncserver
    ### END INIT INFO
     
    # More details see:
    # http://www.penguintutor.com/Linux/tightvnc
     
    ### Customize this entry
    # Set the USER variable to the name of the user to start tightvncserver under
    export USER='pi'
    ### End customization required
     
    eval cd ~$USER
     
    case "$1" in
      start)
        # 启动命令行。此处自定义分辨率、控制台号码或其它参数。
        su $USER -c '/usr/bin/tightvncserver -depth 16 -geometry 800x600 :1'
        echo "Starting TightVNC server for $USER "
        ;;
      stop)
        # 终止命令行。此处控制台号码与启动一致。
        su $USER -c '/usr/bin/tightvncserver -kill :1'
        echo "Tightvncserver stopped"
        ;;
      *)
        echo "Usage: /etc/init.d/tightvncserver {start|stop}"
        exit 1
        ;;
    esac
    exit 0


注：少数玩家默认用户不是pi的请自行更改USER变量
按Ctrl+X，回答Y（存盘）退出nano编辑器。
然后给tightvncserver文件加执行权限，并更新开机启动列表。

`sudo chmod 755 /etc/init.d/tightvncserver`
`sudo update-rc.d tightvncserver defaults`

### 电脑登录VNC

下载Windows客户端[RealVNC Viewer](http://pan.baidu.com/share/link?shareid=547427462&uk=605377859)
登录地址输入“IP地址:控制台号码”，0号控制台可不加号码,也可使用Android版VNC客户端，下载地址：http://android.d.cn/software/19334.html
 ![image_1bboiikhcqbssnh1b811f0d12pd9.png-14.7kB][1]
输入树莓派密码就可以了
 
登录界面如下：
 
 ![image_1bboijkri1s56f07fd51ara1d40m.png-127.5kB][2]


附：手工启动与参数（以下用处不大，没兴趣请略过）
使用此命令手工启动VNC服务器程序：
`tightvncserver -geometry 800x600 :1`
如果首次启动，并且未曾使用vncpasswd命令设置密码，程序会要求设置一个。
开机启动很方便。如果没理由，真的不推荐手工启动。
命令行参数说明：
一、`:1`指定控制台的号码。
启动多个控制台，可以提供互不影响的多个桌面环境。（大多数人不用多用户操作所以没意义）
可以不加此参数，tightvncserver会自动寻找从1开始的下一个空闲控制台。
加上此参数，会强制使用指定的控制台，如果此控制台已经启动则报错。加此参数可有效防止无意多次启动程序（会启动多个控制台）白白浪费系统资源。
特殊的0号控制台
0号控制台就是连接真实显示器真正输出图像的那个桌面。
对于VNC客户端，不输入端口号登录，默认就登录到0号控制台，方便。
但是因为0号是真正的桌面，所以和开机启动桌面环境，或者自己用startx命令，都存在啰嗦的冲突。
到头来是个麻烦。因此自动启动的配置教程中，一律使用1号控制台。
二、`-geometry 800×600`，分辨率。可以不加。
终止VNC控制台：
`tightvncserver -kill :1`
查看正在运行的控制台列表：
`ps ax | grep Xtightvnc | grep -v grep`
 
 
 

## 方法2
 
转载请注明：@小五义http://www.cnblogs.com/xiaowuyi

一、添加国内软件源
Raspberry Pi(树莓派)国内软件源：（http://www.linuxidc.com/Linux/2013-10/91012.htm）
修改配置文件：
pi@aborn ~ $ vi /etc/apt/sources.list
 
deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ wheezy main contrib non-free rpi
deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ wheezy main contrib non-free rpi
deb http://mirrors.neusoft.edu.cn/raspbian/raspbian/ wheezy main contrib non-free rpi
deb-src http://mirrors.neusoft.edu.cn/raspbian/raspbian/ wheezy main contrib non-free rpi
deb http://mirrors.ustc.edu.cn/raspbian/raspbian/ wheezy main contrib non-free rpi
deb-src http://mirrors.ustc.edu.cn/raspbian/raspbian/ wheezy main contrib non-free rpi
 
（这里如果vi不会用，可以百度一下。）
修改文件后，在终端中运行：
sudo apt-get update
 
二、添加输入法
这里我习惯用fcitx
于是安装fcitx
`sudo apt-get install fcitx fcitx-tables-wbpy`
 
三、添加vnc server
`sudo apt-get update`
`sudo apt-get install tightvncserver`
安装完成后，运行
`tightvncserver`
这时会要求输入控制密码，选择性输入查看密码，查看密码只能用来查看桌面，而控制密码才能对桌面进行操作。
此后，在电脑上安装vnc软件，下载地址：http://www.tightvnc.com/
安装时，选择自定义安装，仅安装tightvncviewer就可以。
每个用户可以启动多个VNCSERVER远程桌面，它们用ip加端口号：ip:1、ip:2、ip:3来标识、区分，使用同一端口会使另外登录的用户自动退出。
四、设定固定IP
设定成固定IP后，方便日后操作，不需要每次先读取到IP才能工作。设定方法很简 单，通过修改文件sudo vi /etc/network/interfaces文件完成，这里会用到root权限，树莓派root权限的获取可参考上一节评论（http: //www.cnblogs.com/xiaowuyi/p/3980037.html）。
1、有线网络固定IP修改
原文件为：

    auto lo
     
    iface lo inet loopback
    iface eth0 inet dhcp
     
    allow-hotplug wlan0
    iface wlan0 inet manual
    wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
    iface default inet dhcp

 
这里iface eth0 inet dhcp设置有线网络eth0为动态获取IP，因此可做如下修改：

    auto lo
    iface lo inet loopback
    iface eth0 inet static
    address 192.168.1.123
    netmask 255.255.255.0
    gateway 192.168.1.1
     
    allow-hotplug wlan0
    iface wlan0 inet manual
    wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
    iface default inet dhcp

2、无线网络的修改

    auto lo
     
    iface lo inet loopback
    iface eth0 inet dhcp
     
    allow-hotplug wlan0
    iface wlan0 inet manual
    wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
    iface default inet static
    address 192.168.1.123
    netmask 255.255.255.0
    gateway 192.168.1.1

修改成功后，IP地址换为192.168.1.123。
五、vnc的使用
通过以上的安装，每次启动vnc后，我们就不需要再连接显示器了，而是直接通过电脑就可以操作。具体方法是：
启动后，电脑通过putty与其连接：
连接后，运行tightvncserver，建立一个新窗体。然后打开tightvncviewer，输入密码，出现窗体，如下图:
1、停止VNC窗口：
`vncserver -kill:1`
2、修改密码
`vncpasswd`
3、重启服务
`service vncserver restart`
 


  [1]: http://static.zybuluo.com/RedFalsh/k5vi020vjipy0ocoqmd8zyug/image_1bboiikhcqbssnh1b811f0d12pd9.png
  [2]: http://static.zybuluo.com/RedFalsh/au42ip2fu7vu00tg6mgcn741/image_1bboijkri1s56f07fd51ara1d40m.png