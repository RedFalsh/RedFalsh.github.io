---
title: Raspberry Pi 3——开源堡垒机Gate One的安装、配置笔记（远程web访问）
date: 2017-03-20 21:04:04
tags:
- Raspberry
- Linux
- Gate One
- web
categories: 
- Learn
- Raspberry

---


# Raspberry Pi 3——开源堡垒机Gate One的安装、配置笔记（远程web访问）
## Gate One简介
GateOne是一款基于HTML5的开源终端模拟器/SSH客户端，同时内置强大的插件功能。它自带的插件使其成为一款令人惊艳的SSH客户端，但是，它可以用于运行任何终端应用。用户可以将GateOne嵌入其他应用程序从而提供各类终端访问界面，它也支持各类基于Web的管理界面……后面的大家自己看吧

Gate One在后台进程是使用Python实现的，其前端则是JaveScript+WebSockets。关于Gate One的介绍、源码和文档请参考下面的链接。


Gate One主页：http://liftoffsoftware.com/Products/GateOne
Gate One源码：https://github.com/liftoff/GateOne
Gate One文档：http://liftoff.github.io/GateOne/

## Gate One安装
Gate One要求系统必须满足下面两个前提条件，
  （1）python: 2.6+ or 3.2+
  （2）Tornado Framework 2.2+
### 系统环境准备
在命令行终端中输入命令
`$ python -V`
查看你本机是否安装了python，如果先安装python（注：树莓派上面自己带有python2和python3，python2对应python命令，python3对应python3命令）。
然后安装pip，
`$ wget  --no-check-certificate https://bootstrap.pypa.io/get-pip.py`
`$ sudo python get-pip.py`
安装tornado，
`$ sudo pip install tornado`
安装完成之后，我们来验证一下我们的环境，
`$ python -V`
`$ python -c "import tornado; print(tornado.version)"`
![image_1bbohallt16b0ces1flp1nd2k29.png-11.3kB][1]
### Gate One获取和安装
如果本地没有安装Git，则先安装git，
`$ sudo apt-get install git`
获取Gate One源码并进行安装，（注：这个地方git clone会下载到当前目录下！所以下载前记得cd到你想下载的位置目录去）
`$ git clone https://github.com/liftoff/GateOne.git`
`$ cd GateOne`
`$ sudo python ./setup.py install`
## Gate One验证
Gate One的配置文件是/etc/gateone/conf.d/10server.conf，
[python] view plain copy print?在CODE上查看代码片派生到我的代码片
`sudo vi /etc/gateone/conf.d/10server.conf`  

我们修改配置文件如下图：
![image_1bbohbqbg8qi1jf01fvmfm52rmm.png-85.2kB][2]
这里我们修改了：
"address" = "192.168.1.106" 这个是树莓派的ip地址
"https_redirect" = "true"
"port" = 8000 这个是监听端口

其他默认就可以了
输入命令：
`$ sudo gateone`


 
启动后，通过打印的信息，我们看到Gate One服务监听了8000端口号，然后在浏览器中输入https://192.168.1.106:8000/即可打开gateone的网页，这个貌似是局域网内......。
网络会进行拦截，点击   高级 ——添加例外——确认即可


  [1]: http://static.zybuluo.com/RedFalsh/cf422ionyhf4bv1qozr2dg0h/image_1bbohallt16b0ces1flp1nd2k29.png
  [2]: http://static.zybuluo.com/RedFalsh/2cdsoru8v51ilhio6dkrkspt/image_1bbohbqbg8qi1jf01fvmfm52rmm.png
