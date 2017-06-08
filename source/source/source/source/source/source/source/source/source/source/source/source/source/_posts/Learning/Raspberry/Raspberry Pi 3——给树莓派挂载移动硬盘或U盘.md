---
title: Raspberry Pi 3——给树莓派挂载移动硬盘或U盘
date: 2017-03-20 21:04:04
tags:
- Raspberry
- Linux
- mount
categories: 
- Learn
- Raspberry

---

# Raspberry Pi 3——给树莓派挂载移动硬盘或U盘

* 查看U盘信息
`fdisk -l  `

* 挂载U盘
`sudo mkdir /mnt/1GB_USB_flash  `
`sudo mount -o uid=pi,gid=pi /dev/sda1 /mnt/1GB_USB_flash  `
* 卸载U盘
`sudo umount /mnt/1GB_USB_flash`  

sda1 是取决于你的实际情况，a表示第一个硬盘，1表示第一个分区。

## 挂载exFAT格式的硬盘
FAT 格式U盘mount 本身就能支持，但如果你的U盘或移动硬盘使用的是exFAT 格式，mount会说不支持。没关系，安装 exfat-fuse软件之后 mount就支持了。
`sudo apt-get install exfat-fuse  `

如果想开机自动挂载，而不是每次手工执行，可以编辑 /etc/fstab 文件。比如在末尾添加一行：
`/dev/sda1 /mnt/usbdisk vfat rw,defaults 0 0 ` 
挂载NTFS格式的硬盘(读写方式挂载)
默认挂载NTFS格式的硬盘只有只读权限，需要借助其它工具实现。

* 安装所需软件包  
`sudo apt-get install fuse-utils ntfs-3g  `
* 加载内核模块  
`modprobe fuse  `
* 编辑fstab让移动硬盘开机自动挂载  
`sudo nano /etc/fstab`  
* 在最后一行添加如下内容  
`/dev/sda1 /mnt/myusbdrive ntfs-3g defaults,noexec,umask=0000 0 0` 
  
* 保存重启，即可生效  


## 挂载FAT32格式的硬盘
* 创建挂载点  
`sudo mkdir /mnt/myusbdrive  `
* 编辑fstab让移动硬盘开机自动挂载  
`sudo nano /etc/fstab  `
* 在最后一行添加如下内容  
`/dev/sda1 /mnt/myusbdrive auto defaults,noexec,umask=0000 0 0  `
* 保存重启，即可生效  


说明：
sda1是取决于你的实际情况，a表示第一个硬盘，1表示第一个分区。
`umask=0000 0 0`
前面四个0就是对所有人,可读可写可执行,
后面两个0,第一个代表dump,0是不备份
第二个代表fsck检查的顺序,0表示不检查
卸载：`sudo umount /mnt/myusbdrive`
查看挂载情况可使用以下命令。
`cd /mnt/myusbdrive ` 
`ls`
 



