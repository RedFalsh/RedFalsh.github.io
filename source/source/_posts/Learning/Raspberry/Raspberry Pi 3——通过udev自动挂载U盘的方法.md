---
title: Raspberry Pi 3——通过udev自动挂载U盘的方法
date: 2017-03-20 21:04:04
tags:
- Raspberry
- udev 
- Linux
categories: 
- Learn
- Raspberry

---

# Raspberry Pi 3——通过udev自动挂载U盘的方法

&emsp;&emsp;目前一些主流桌面系统(如Gnome,KDE,Xfce)的较新版本都支持自动挂载(mount)U盘了. 一个流传非常广的说法是 HAL(硬件抽象层) 起了自动挂载的作用, 其实这是误解. 对于2.6内核而言, udev 才是直接从内核接收设备连接或断开信息的主体.
&emsp;&emsp;udev 从内核得到信息后,根据一些简单规则(注意,是简单规则), 在 /dev 目录下创建相应的设备节点, 并进行某些相关操作. HAL 所做的事情是在 udev 的规则中加上一条(或几条), 让 udev 把收到的信息也传递给 HAL. 接下来, HAL 用更为复杂的规则来匹配和描述当前连接着的硬件. 举一个简单的例子, udev 知道的是U盘已连接了并且有一个分区; 而 HAL 能更进一步知道这个分区的卷标名及其他一些信息.
&emsp;&emsp;上面这些都还不能自动挂载U盘. Gnome 等桌面系统会启动一个守护进程(daemon), 通过 D-Bus 从 HAL 那里得到硬件信息, 如果发现有U盘连接了就由他们来挂载他(实际是调用 pmount).
&emsp;&emsp;问题是, 如果你不想用Gnome,KDE,Xfce这些桌面系统, 那么由他们提供的U盘自动挂载功能也就失效了,有解决办法么?
解决的办法之一, 便是让 udev 来干这件事情!
&emsp;&emsp;udev 的主要功能是实时地在 /dev 目录下创建和删除设备节点, 但他也能在创建节点的同时, 执行一个额外地程式. 具体的原理这里就不详说了, 有时间请仔细阅读
Writing udev rules 
&emsp;&emsp;这篇文章. 写规则时特别注意 KERNEL, SUBSYSTEM 等这些关键字单数和复数(最后有没有’S’)的差别. 复数(比如 KERNELS)表示你想用父设备的属性来匹配, 单数(比如 KERNEL)是要匹配设备本身的属性.

* 在 /etc/udev/rules.d 目录下创建文件 10_usbkey.rules, 其内容如下
```
KERNEL=="sda1", SUBSYSTEM=="block", RUN+="/root/usbmount.sh"  
```

* 然后, 在 /root 目录中创建文件 usbmount.sh, 其内容为
```
#!/bin/bash  
LOG=/var/log/usb-hotplug.log  
lap=$(date --rfc-3339=ns)  
echo "$lap: $DEVPATH requesting $ACTION" >> $LOG  
if [ $ACTION == "add" ]  
then  
    mount -t vfat -o umask=000,noatime,async,codepage=936,iocharset=gb2312 \  
        /dev/sda1 /media/usbkey  
elif [ $ACTION == "remove" ]  
then  
    umount -l /media/usbkey  
fi  
```

* 并把该文件属性设置为可执行, 
`chmod a+x usbmount.sh `  

注意: 如果你的 linux 上 locale 是 zh_CN.utf-8, 需要把上面的 iocharset=gb2312 改成 iocharset=utf8
* 最后创建目录, 
`mkdir /media/usbkey `  

这是个非常简单但可用的例子. U盘插上后自动 `mount` 到 `/media/usbkey` , 拔出后自动 `umount`. 你能查看 `/var/log/usb-hotplug.log` , 里面会有些简单的调用记录.


在`/usr/share/hal/fdi`及其子文件夹下看一下是不是有一个名称里含有`gparted`的文件，如果有把它删掉应该自动挂载就好


