---
title: Archlinux-conky安装配置.md 
date: 2017-03-20 21:04:04
tags: 
- Archlinux
- Linux
categories: 
- Learn
- Archlinux

---

参考
* [conky官方wiki](https://wiki.archlinux.org/index.php/Conky)
* [conky harmattan主题](http://zagortenay333.deviantart.com/art/Conky-Harmattan-426662366)
* [conky-lua主题](http://gnome-look.org/content/show.php/Conky+lua?content=139024)

**安装conky**
`pacman -S conky`
**图形界面管理conky**
`pacman -S conky-manager`

## conky-lua安装
* **conky-lua支持**
`yaourt conky-lua `
* **conky-nvidia支持**
`yaourt conky-nvidia`
* **lua与nvidia同时支持**
`yaourt conky-lua-nv`
## conky-lua使用

conky-lua主题下载

[139024-Conky-lua1.tar.gz](https://dl.opendesktop.org/api/files/download/id/1465391037/139024-Conky-lua1.tar.gz)

**git archlinux-conky**

`git clone https://github.com/RedFalsh/archlinux_conky.git`

**进入**

`cd archlinux_conky/Conky-lua/`

**解压主题`'Conky Mint-lua.tar.gz'`**

`tar -xvzf 'Conky Mint-lua.tar.gz'`

**进入Conky Mint-lua文件夹**

`cd 'Conky Mint-lua'`

**复制相关文件到用户目录下**

`cp conkyrc ~/.conkyrc`

`cp clock_rings.lua ~/.lua/scripts/`

**运行conky**

`conky`

> 注：conkyrc中显示温度的符号可能出错，需要相应的系统编码，可以去掉温度显示

### conky-manager

`mkdir -p ~/.conky/Conky\ Mint-lua`

`cp Cokny\ Mint-lua/conkyrc ~/.conky/Cokny\ Mint-lua/`

## conky harmattan

**参考** 

* [zagortenay333/Harmattan](https://github.com/zagortenay333/Harmattan)


