---
title: Raspberry--官方7寸屏相关配置简介
date: 2017-06-09 16:06:14
tags:
- Raspberry
- LOGO
- Linux
categories:
- Learn
- Raspberry

---

# Raspberry--官方7寸屏相关配置简介

## 1. 引子


在树莓派官方触摸屏发布之前，市场上可用的屏幕有以下三种：

* 直接和GPIO插口对接的屏幕，使用SPI与CPU进行通信。需要特殊的驱动程序将framebuffer的内容发送到LCD控制器上，一般带有触屏功能，大小以3.5寸为主流。受限于SPI通信速度，刷新速率不高；
* 专用USB接口的屏幕，如RoboPeak Mini USB Display。这类屏幕通过USB连接，需要本地运行驱动程序；
* 通用LCD屏幕，通过HDMI和树莓派连接。因其通用性不需要特殊的驱动程序，但是很多都不支持触屏功能，而且都需要额外的转接板，体积较大；

![▲ 图.  树莓派官方7寸屏实拍](http://www.yfworld.com/?attachment_id=3712)

我自己的需求是将树莓派作为信息显示中心，在屏幕上显示我的HP服务器的运行信息，另外提供一些快捷的传感器监控和控制操作接口。最初一直在官方屏幕和HDMI屏幕之间犹豫，最后还是选择了官方触摸屏。归结起来主要有几个原因：

* 官方屏的LCD模组最有保证，淘宝上的HDMI LCD一般成像质量不高；
* 官方屏的触摸功能在所有方案中是支持的最好的，有十点电容触摸（目前Raspbian还只支持单点，以后会升级），且不需要额外驱动。而HDMI接口的LCD如果有触摸功能，都需要额外接一根USB用于提供触摸控制；
* 官方触屏和树莓派3可以直接通过铜柱物理连接，无需额外的驱动电路板。连线也非常少，只需要一根DSI软排线和供电接口即可。

总体上来说，虽然官方屏的价格高了一些，但是却是所有方案中最可靠、简洁的，所以最后也没有多犹豫就从网上下单了。

▲ 图. 树莓派官方LCD屏实拍 – 正面


## 2. 入手简评

这款屏幕官方公布的主要参数有：

* 分辨率800 x 480像素，刷新率60fps；
* 10点电容触摸，但是目前只支持单点触控；
* 背后有可供背挂的安装定位孔；
* 可视角度70度 ，可视区域大约为155 x 86mm；
* 非方形像素 – 大约为0.19 x 0.175mm；
* 电源功耗：455mA – 470mA之间，约为2.3W。

虽然说这款屏幕是相对来说比较好的选择，但是拿到手之后还是发现了很多存在的问题：

* 首先是这款屏幕的分辨率只有800 x 480，是WVGA标准，很多应用软件的界面都无法完全显示，使用时要经常拖动窗口来显示需要的信息；同样的，如果是自己开发图形界面，能够显示内容的空间也会比较有限（尤其考虑到任务栏也占用了一部分空间）；
* 其次是这个屏幕的可视角不大。现在主流的LCD屏幕可视角都是120度以上了，而这款屏只有70度，工作时只要稍微变换一下角度屏幕的内容就看不清楚了。可视角的问题在仰视时还可以接受，俯视的时候就非常明显了；
* 最后就是这个屏幕比较吃电，如果和树莓派供用电源，会影响到树莓派的供电。如果出现供电不足的情况，屏幕的右上角就会时不时出现一个方形的彩虹图标。
总体来说这款屏幕从设置到使用还是比较方便的，但是作为官方发布的屏幕，同时再考虑其600块钱的定价，整体性价比就显得不高了。



## 3. 使用方法

### 3.1 注意事项（使用前必读）

* 1) 这款屏幕主要支持的树莓派型号是Model A+, B+, Pi 2和Pi 3。 Model A和B虽然也可以使用，但是会牺牲I2C的功能（因为这两个型号只有一组I2C，而其他型号有两组，可用其中一组作触屏接口）；

* 2) 至于操作系统，推荐使用最新版原生Raspbian OS。目前对NOOBS系统支持不好，所以还是推荐安装Raspbian；如果已经在使用旧版Raspbian，但是不想重新安装最新的系统，可以使用以下命令升级系统：
```
sudo apt-get update
sudo apt-get install --reinstall libraspberrypi0 libraspberrypi-{bin,dev,doc} raspberrypi-bootloader
sudo reboot
```
以下是官方公布的操作系统支持情况：
```
– Raspbian – Supported
– Ubuntu MATE – Supported
– RetroPie – Supported
– OpenElec – Supported
– OSMC – Supported
– Arch – Display works, Touch may be tricky: https://www.raspberrypi.org/forums/viewtopic.php?f=108&t=128452
– Kano OS – Not supported
```

* 3) 确保使用官方电源（或其他品牌电流供应能力 > 2A以上的电源），保证屏幕可以正常供电；

* 4) FPC连接头很脆，安装的时候需要小心一点。确保FPC连接头可靠链接，连接端口的卡口扣下。



### 3.2 安装方法

打开包装后，屏幕背面接口的情况如下图所示：

▲ 图. 树莓派官方LCD屏背面接口

这里主要需要连接的就是LCD软排线和电源供电接口。LCD软排线连接的时候问题不大，主要就是注意接口触电的方向是否正确，不要装反了。至于电源接口，这款屏幕提供三种供电方式：

* 1) GPIO引脚供电（树莓派向LCD供电）

可以直接从树莓派跳VCC和GND线进行连接，然后给树莓派供电，但是这样就无法使用其他IO扩展板了（如SenseHat）。

▲图. GPIO供电连接方法

* 2) USB串联供电（LCD向树莓派供电）

将LCD的Power Out端连接至树莓派，然后给LCD电源接口供电。经测试，这种方式供电经常会遇到之前说的供电不足的情况，屏幕右上角会出现彩虹图标。

▲图. USB串联供电连接方法

* 3) 双USB同时供电

两个USB都单独供电，但是要保证两个USB可以同时上电，否则会出现开机没有初始化屏幕，而没有图形显示的问题。

电源和软排线连线完成后就可以固定树莓派了。树莓派的安装方法有两种：正装和反装。所谓正装，就是将树莓派以相同方向安装在LCD的铜柱固定柱上。而反装，则是将树莓派面朝LCD驱动板进行安装。反装可以节省空间，但是反装就无法再使用GPIO引脚了，所以一般情况下都是正装的。

官方屏不含支架，可以去网上购买专用的LCD支架，像我买的这款用起来就不错：

▲图. LCD亚克力支架



### 3.3 使用虚拟键盘

对于想使用触摸屏进行全部操作的朋友，可以安装一个虚拟键盘进行文字输入：

#### 3.3.1 Florence

Suggested on the Pi forums by Hove is Florence: http://xmodulo.com/onscreen-virtual-keyboard-linux.html. Install with:

`sudo apt-get install florence`



#### 3.3.2 Matchbox

Suggested by Alex ( the almighty @raspitv ), and scattered on various blogs, is Matchbox, which you can install like so:

`sudo apt-get install matchbox-keyboard`

And then find in Accessories > Keyboard.



## 4. FAQ问题解答

**Q: 屏幕上下180度翻转**

A: 打开SD卡中的/boot/config.txt文件，增加以下一行：

`lcd_rotate=2`

也可以直接使用以下命令：

`echo "lcd_rotate=2" | sudo tee -a /boot/config.txt`



**Q: 程序控制背光**

A: 打开背光:

`echo 0 > /sys/class/backlight/rpi_backlight/bl_power`

关闭背光:

`echo 1 > /sys/class/backlight/rpi_backlight/bl_power`

取消屏幕进入睡眠
`sudo nano /etc/lightdm/lightdm.conf`
添加如下内容到[SeatDefaults]选项中
`xserver-command=X -s 0 dpms`


**Q: 在Pi A, B上使用**

A: 首先需要将树莓派的IIC线与LCD控制板的IIC总线手动连线在一起，包括SDA ( http://pinout.xyz/pinout/pin3_gpio2) 和 SCL (http://pinout.xyz/pinout/pin5_gpio3)。之后修改配置，在IIC总线上识别LCD：

`ignore_lcd=0`

注意: 其他IIC设备将无法使用。



**Q: 屏幕左上角出现方形彩虹图标**

A: 电源供电不足，请使用电流供应能力 > 2A的电源。



**Q: 如何使用Kivy图形库**

A: Kivy介绍：Kivy is a Python GUI development system for cross-platform applications. It is designed to work with touchscreen devices (phones and tablets), but also runs on the Raspberry Pi. To install Kivy onto your Pi follow the instructions at https://kivy.org/docs/installation/installation-rpi.html.

如果需要在树莓派上正常识别触摸屏输入，需要将触摸屏在Kivy中配置成为输入源。打开配置文件 ~/.kivy/config.ini ，在 [input] 一栏增加以下命令：

`mouse = mouse`
`mtdev_%(name)s = probesysfs,provider=mtdev`
`hid_%(name)s = probesysfs,provider=hidinput`


Reference

[1] Official 7” Raspberry Pi Touch Screen FAQ, PIMORONI, http://forums.pimoroni.com/t/official-7-raspberry-pi-touch-screen-faq/959

[2] Getting Started with the Pi 7″ Touchscreen LCD, PIMORONI, http://learn.pimoroni.com/tutorial/pi-lcd/getting-started-with-raspberry-pi-7-touchscreen-lcd
