---
title: Archlinux-yaourt安装配置.md
date: 2017-03-20 21:04:04
tags:
- Archlinux
- Linux
- yaourt
- Raspberry
categories:
- Learn
- Archlinux
- Raspberry

---
## 参考


## archlinux安装yaourt

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


## 树莓派安装yaourt
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



