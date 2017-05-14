---
title: Raspberry Pi 3——树莓派开机LOGO设置
date: 2017-03-20 21:04:04
tags:
- Raspberry
- LOGO 
- Linux
categories: 
- Learn
- Raspberry

---

# Raspberry Pi 3——树莓派开机LOGO设置

* 安装`fbi`
`sudo apt-get install fbi  `

* 拷贝你需要显示的splash图片至 `/etc/` 命名为`splash.png`.
* 接下来,创建一个`init.d`脚本称为`asplashscreen` 放入`/ etc /init.d/`文件目录下。
我选择文件名字为`asplashscreen`和一个`a`开始时先确保它开始。
   
``` 
#! /bin/sh  
  
### BEGIN INIT INFO  
  
# Provides:          asplashscreen  
  
# Required-Start:  
  
# Required-Stop:  
  
# Should-Start:        
  
# Default-Start:     S  
  
# Default-Stop:  
  
# Short-Description: Show custom splashscreen  
  
# Description:       Show custom splashscreen  
  
### END INIT INFO  
  
   
  
   
  
do_start () {  
  
   
  
    /usr/bin/fbi -T 1 -noverbose -a /etc/splash.png      
  
    exit 0  
  
}  
  
   
  
case "$1" in  
  
  start|"")  
  
    do_start  
  
    ;;  
  
  restart|reload|force-reload)  
  
    echo "Error: argument '$1' not supported" >&2  
  
    exit 3  
  
    ;;  
  
  stop)  
  
    # No-op  
  
    ;;  
  
  status)  
  
    exit 0  
  
    ;;  
  
  *)  
  
    echo "Usage: asplashscreen [start|stop]" >&2  
  
    exit 3  
  
    ;;  
  
esac  
  
   
  
:  
```

上面是脚本文件内容
 
* 然后使init脚本可执行并安装模式rcS:
`sudo chmod a+x /etc/init.d/asplashscreen  `
`sudo insserv /etc/init.d/asplashscreen ` 

* 重启,看您的自定义启动画面:
`sudo reboot  `





