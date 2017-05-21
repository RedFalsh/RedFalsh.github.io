---
title: Raspberry Pi 3——cxfreeze打包python程序
date: 2017-03-20 21:04:04
tags:
- Raspberry
- cxfreeze 
- python
categories: 
- Learn
- Raspberry

---
# Raspberry Pi 3——cxfreeze打包python程序
## 参考
* [cxfreeze官网](https://anthony-tuininga.github.io/cx_Freeze/)
* [cxfreeze下载地址](https://pypi.python.org/pypi/cx_Freeze/)
* [使用说明文档](http://cx-freeze.readthedocs.io/en/latest/)

## 说明
Python是一个脚本语言，被解释器解释执行。它的发布方式：

* py文件：对于开源项目或者源码没那么重要的，直接提供源码，需要使用者自行安装Python并且安装依赖的各种库。（Python官方的各种安装包就是这样做的）
* pyc文件：有些公司或个人因为机密或者各种原因，不愿意源码被运行者看到，可以使用pyc文件发布，pyc文件是Python解释器可以识别的二进制码，故发布后也是跨平台的，需要使用者安装相应版本的Python和依赖库。
* 可执行文件：对于非码农用户或者一些小白用户，你让他装个Python同时还要折腾一堆依赖库，那简直是个灾难。对于此类用户，最简单的方式就是提供一个可执行文件，只需要把用法告诉Ta即可。比较麻烦的是需要针对不同平台需要打包不同的可执行文件（Windows,Linux,Mac,...）。
本文主要就是介绍最后一种方式，.py和.pyc都比较简单，Python本身就可以搞定。将Python脚本打包成可执行文件有多种方式，本文重点介绍cx_Freeze，其它仅作比较和参考。
Freezing Your Code
各种打包Python程序对比 点击打开链接
各种打包工具的对比如下(来自文章Freezing Your Code)：

| |||||||||||
|--|--|--|--|--|--|--|--|
|Solution|	Windows	|Linux|	OS X|	Python 3|	License|One-file mode|	Zipfile| import	Eggs|	pkg_resources support|
|bbFreeze|	yes|	yes|	yes	|no	|MIT|	no|	yes	|yes|	yes|
|py2exe	|yes|	no	|no	|yes|	MIT	|yes|	yes	|no	|no
|pyInstaller|	yes|	yes|	yes|	no|	GPL|	yes|	no|	yes	no|
|cx_Freeze|	yes|	yes|	yes|	yes|	PSF	|no	|yes|	yes|	no|
|py2app|	no|	no	|yes|	yes	|MIT|	no	|yes|	yes|	yes|
我要打包的环境是Linux+Python3，故根据情况我们采用cx_Freeze打包程序

## 使用
Python3程序打包步骤：
1、下载cx_Freeze-4.3.4.tar.gz源码
2、解压源码到某个目录
3、打开终端到解压目录
4、执行python3 setup.py build
这编译会出错 

    build/temp.linux-x86_64-2.7/source/bases/Console.o：在函数‘GetImporterHelper’中：
    /home/bill/Downloads/cx_Freeze-4.3.3/source/bases/Common.c:211：对‘PyObject_CallMethod’未定义的引用
    /home/bill/Downloads/cx_Freeze-4.3.3/source/bases/Common.c:215：对‘PyErr_Clear’未定义的引用
    build/temp.linux-x86_64-2.7/source/bases/Console.o：在函数‘GetDirName’中：
    /home/bill/Downloads/cx_Freeze-4.3.3/source/bases/Common.c:66：对‘PyString_FromStringAndSize’未定义的引用
    build/temp.linux-x86_64-2.7/source/bases/Console.o：在函数‘FatalError’中：
    /home/bill/Downloads/cx_Freeze-4.3.3/source/bases/Console.c:24：对‘PyErr_Print’未定义的引用
    /home/bill/Downloads/cx_Freeze-4.3.3/source/bases/Console.c:25：对‘Py_FatalError’未定义的引用
    build/temp.linux-x86_64-2.7/source/bases/Console.o：在函数‘SetExecutableName’中：
    /home/bill/Downloads/cx_Freeze-4.3.3/source/bases/Common.c:93：对‘PyString_FromString’未定义的引用
    /home/bill/Downloads/cx_Freeze-4.3.3/source/bases/Common.c:115：对‘PyString_FromStringAndSize’未定义的引用
    /home/bill/Downloads/cx_Freeze-4.3.3/source/bases/Common.c:136：对‘PyString_FromString’未定义的引用
    build/temp.linux-x86_64-2.7/source/bases/Console.o：在函数‘FatalError’中：
    /home/bill/Downloads/cx_Freeze-4.3.3/source/bases/Console.c:24：对‘PyErr_Print’未定义的引用

查了一下 网上有修改setup.py  将其中的if not vars.get("Py_ENABLE_SHARED", 0):修改成if True：
就可以了
5、执行安装命令`sudo python3 setup.py install`
6、此时再次打开一个终端，输入命令：`cxfreeze --help`有内容说明安装
7、打包命令输入：
查询版本：
`cxfreeze --version `
打包文件（包含运行需要的文件）：
`cxfreeze ~/Desktop/Nt2000_Python1/Nt_Main.py --target-dir ~/Desktop/setup`
格式为：cxfreeze 文件绝对路径 --target-dir 打包到目标可执行文件夹路径
打包成一个可执行文件命令：
`cxfreeze D:/hello.py --target-dir D:/123 --no-copy-deps `




