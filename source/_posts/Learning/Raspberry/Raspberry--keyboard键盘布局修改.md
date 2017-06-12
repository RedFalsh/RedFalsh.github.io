---
title: Raspberry--keyboard键盘布局修改
date: 2017-06-09 11:20:51
tags:
- Raspberry
- Linux
- keyboard
categories:
- Learn
- Raspberry

---


# Raspberry--keyboard键盘布局修改

## 参考链接

[https://wiki.debian.org/Keyboard](https://wiki.debian.org/Keyboard)

## 改变布局设置

* 设置命令
`dpkg-reconfigure keyboard-configuration`
`service keyboard-setup restart`

* 你也可以编辑/etc/default/keyboard

```
# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc101"
XKBLAYOUT="us"
XKBVARIANT="alt-intl"
XKBOPTIONS=""

BACKSPACE="guess"
```
