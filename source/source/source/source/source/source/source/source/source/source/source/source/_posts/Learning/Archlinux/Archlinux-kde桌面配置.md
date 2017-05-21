---
title: Archlinux-kde桌面配置.md 
date: 2017-03-20 21:04:04
tags: 
- Archlinux
- Linux
categories: 
- Learn
- Archlinux

---


## compiz安装

**参考**

[compiz简体中文wiki](https://wiki.archlinux.org/index.php/Compiz)

这里要特别注意：

* 目前没有任何一个包自动提供 kde-window-decorator （一个KDE窗口装饰器组件）。想要安装它，你需要编辑将要安装的 Compiz 包中的 PKGBUILD 文件，从中打开相关的选项。当你编辑完之后，还需要重新编译并安装 Compiz 包。

编辑PKGBUILD文件，打开，修改
`-DBUILD_KDE4=Off \ `
改为
`-DBUILD_KDE4=On \ `

**设置开机启动**

* **使用系统设置**
打开系统设置程序，并找到“系统设置 > 默认程序 > 窗口管理器 > 使用另外的窗口管理器'”然后选择“Compiz”。
如果你需要让Compiz使用你自己设定的选项启动的话，就选择“Compiz custom”，然后新建一个叫做compiz-kde-launcher 的脚本，并且在其中添加你希望启动Compiz的命令。 下面是一个例子：
`/usr/local/bin/compiz-kde-launcher`
```
#!/bin/bash
LIBGL_ALWAYS_INDIRECT=1
compiz --replace &
wait

```
然后还要让他可运行：
`$ chmod +x /usr/local/bin/compiz-kde-launcher`

* **Autostart 自动启动链接**
注意:
> 如果你想安装 gtk-window-decorator，就不要新建 compiz.desktop 文件，因为这回产生一些问题。
> 如果 compiz.desktop 已经有了，那你可能需要在 Exec 之后添加 --replace 。
在KDE自动启动（Autostart）目录中添加一个项目。如果它不存在，就新建一个：

`~/.kde4/Autostart/compiz.desktop`
```
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=Compiz
Exec=/usr/bin/compiz --replace
NoDisplay=true
# name of loadable control center module
X-GNOME-WMSettingsModule=compiz
# autostart phase
X-GNOME-Autostart-Phase=WindowManager
X-GNOME-Provides=windowmanager
# name we put on the WM spec check window
X-GNOME-WMName=Compiz
# back compat only
X-GnomeWMSettingsLibrary=compiz
```
* **设置 KDEWM 变量**
作为root用户你需要搞一个小脚本，这样你就可以在启动Compiz的时候添加命令行选项了。
新建一个文件，里面输入启动Compiz的命令，再加上你希望附加的设置。下面是一个例子：
`/usr/bin/startcompiz`
`compiz --replace &`
**注意:** 你不一定非要把这个脚本叫做 startcompiz。只要保证你的脚本的名字不会和系统已有的命令（在/usr/bin目录中）弄混就行了。
保证你的脚本可执行：
`# chmod +x /usr/bin/startcompiz`
现在你需要新建一个程序来调用你刚刚在 /usr/bin 中新建的这个脚本了。
1) 只针对你当前的用户设置:
`~/.kde4/env/startcompiz.sh`
`KDEWM="compiz"`
2) 全系统范围内设置:
`/etc/kde/env/startcompiz.sh`
`KDEWM="compiz"`
**注意:**
如果上面的方法不管用，使用下面的命令可以达到同样的目的：
`$ export KDEWM="startcompiz"`
把它放到你用户的 `~/.bashrc` 文件中去。
如果你使用了 `/usr/local/bin` 目录那可能会不管用。那么你需要在脚本中使用绝对路径：
`$ export KDEWM="/usr/local/bin/startcompiz"`

