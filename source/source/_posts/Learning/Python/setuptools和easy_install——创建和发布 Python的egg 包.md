---
title: setuptools和easy_install——创建和发布 Python的egg 包
date: 2017-03-20 21:04:04
tags: Python
categories: 
- Learn 
- Python

---

##setuptools和easy_install——创建和发布 Python的egg 包
**1.参考链接**
    [官方documentstation](https://setuptools.readthedocs.io/en/latest/)
    [setuptools下载地址](https://pypi.python.org/pypi/setuptools)

**2.setuptools和easy_install说明** 
`setuptools:setuptools` 是一组由PEAK(Python Enterprise Application Kit)开发的 Python 的 distutils 工具的增强工具，可以让程序员更方便的创建和发布 Python的egg 包，特别是那些对其它包具有依赖性的状况。 由 setuptools 创建和发布的包看起来和基于 distutils 发布的包没什么不同。最终用户不需要事先安装 setuptools 甚至根本不需要知道 setuptools 的存在，而程序员也不需要附上完整的 setuptools，只需要包含一个大小约 8K 的ez_setup.py脚本作为启动模块，就可以在最终用户没有安装适当版本的 setuptools 时让这些包自动下载和安装 setuptools。
`easy_install:` 常使用python的人员，当需要安装第三方python包时，可能会用到easy_install命令。easy_install是由PEAK(Python Enterprise Application Kit)开发的setuptools包里带的一个命令，它用来自动地从http://pypi.python.org/simple/来安装egg包，相当于perl中的cpan或PPM。

**3.安装**

* **windows上安装setuptool** 
    * 方法1 
   从https://pypi.python.org/pypi/setuptools下载  
    `setuptools-34.3.2-py2.py3-none-any.whl (md5)`
    cmd运行：
    `python pip -m install setuptools-34.3.2-py2.py3-none-any.whl`

    * 方法2
下载ez_setup.py脚本， http://peak.telecommunity.com/dist/ez_setup.py  
命令行运行：
`python ez_setup.py`

* linux上安装
通过引导程序 ez_setup.py安装
`$ wget http://peak.telecommunity.com/dist/ez_setup.py`
`$ sudo python ez_setup.py`
更新setuptools：
`$ sudo python ez_setup.py -U setuptools`



