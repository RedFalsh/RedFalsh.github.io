---
title: Pyinstaller——windows打包python程序
date: 2017-03-20 21:04:04
tags: Python
categories: 
- Learn
- Python

---

# Pyinstaller——windows打包python程序

## 介绍

PyInstaller是一个将Windows程序冻结（包））到Windows，Linux，Mac OS X，FreeBSD，Solaris和AIX的独立可执行程序的程序。与其他类似工具相比，PyInstaller的主要优点是使用Python 2.7和3.3-3.5，它通过透明压缩构建了更小的可执行文件，它是完全多平台的，并且使用操作系统支持来加载动态库，从而确保完全兼容。

PyInstaller的主要目标是与开箱即用的第三方软件包兼容。这意味着，使用PyInstaller，使外部程序包工作所需的所有技巧都已经集成在PyInstaller本身中，因此不需要用户干预。您将永远不需要在维基中寻找技巧，并对您的文件或安装脚本应用自定义修改。例如，完全支持像PyQt，Django或者matplotlib这样的库，而无需手动处理外部数据文件或外部数据文件。有关详细信息，请查看我们的支持包的兼容性列表。

## 参考链接

[Pyinstaller Doc](http://pythonhosted.org/PyInstaller/)

## 安装Pyinstaller

pip安装

`pip install pyinstaller`

当然，也可以通过下载源代码编译方式安装：

`python setup.py install`

## 打包程序

简单使用

`pyinstaller yourprogram.py`

常用选项

通过`pyinstaller --help`命令可查看选项详细说明

## spec文件打包

spec文件案例：
```
# -*- mode: python -*-

block_cipher = None


a = Analysis(['main.py'],
             pathex=['F:\\Python\\Git\\PersonalDose'],
             binaries=[],
             datas=[
				 ('app.ico','.'),
				 ('PersonalDose.db','.'),
				 ('Fonts','Fonts')
			 ],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          exclude_binaries=True,
          name='DoseManager',
          debug=False,
          strip=False,
          upx=False,
          console=False, icon='F:\\Python\\Git\\PersonalDose\\app.ico')
coll = COLLECT(exe,
               a.binaries,
               a.zipfiles,
               a.datas,
               strip=False,
               upx=False,
               name='main')

```
这里介绍一下添加文件的说明
```
datas = [
         ( '/mygame/data', 'data' ), //添加data文件夹
         ( '/mygame/sfx/*.mp3', 'sfx' ), //添加所以.mp3后缀的文件
         ( 'src/README.txt', '.' ) //添加README.txt文件
         ]
```

cmd命令进入spec文件所在位置，并运行

`pyinstaller yourspecfile.spec`

