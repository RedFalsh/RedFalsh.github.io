---
title: win7上编译安装64位VIM
date: 2017-03-20 21:04:04
tags: 
- vim
- win7
categories: 
- Learn
- vim 

---

前提

想找一个64位的Vim并且支持Python和Lua功能不容易，所以研究了一天，查了不少资料，终于成功编译，记录一下。
**一、编译环境选择和安装**
**1. 选择编译环境**
从网上查看Win上的编译环境 Cygwin、MinGW、MSYS2等，我选了MSYS2作为编译环境，而且MSYS2用Pacman进行包管理 ，用过ArchLinux的比较方便不少。

**2. 安装MSYS2编译环境**

* 下载安装msys2, 默认文件目录为：C:\msys64, 编译环境为以此目录为根目录。

* 修改/etc/pacman.d/目录下3个文件mirrorlist.mingw32, mirrorlist.mingw64,  mirrorlist.msys, 添加软件源提升下载速度：
    * 添加Server = http://mirrors.ustc.edu.cn/msys2/REPOS/MINGW/i686 到mirrorlist.mingw32文件首行。
    * 添加Server = http://mirrors.ustc.edu.cn/msys2/REPOS/MINGW/x86_64 到mirrorlist.mingw64文件首行。
    * 添加Server = http://mirrors.ustc.edu.cn/msys2/REPOS/MSYS2/$arch 到mirrorlist.msys文件首行。
    * 运行 pacman -Syu 更新

* 安装编译器,调试器,make工具, git pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-gdb mingw-w64-x86_64-make git
* 提前安装 pacman -S diffutils ，此包包含 diff 命令，因我在编译过程碰到没有 diff 命令。

**二 编译Vim**
**1. 编译前准备软件安装**

* 下载 Python2.7.9(x64) 安装到 C:\Python27
* 下载 Python3.4.3(x64) 安装到 C:\Python34
* 下载 Ruby 2.2.3 (x64) 安装到 C:\Ruby22-x64
* 下载lua-5.3_Win64_bin.zip 和 lua-5.3_Win64_dllw4_lib.zip，解压2个包到 C:\Lua53
* 编译电脑系统为Win7 64位 旗舰版
* 下载Vim源码

    `cd ~`
    `git clone https://github.com/tracyone/vim vim-master`


**2. 设置编译参数文件**

* 打开64位编译环境 mingw64_shell
* 进入src文件 cd ~/vim-master/src
* 复制编译文件 Make_cyg_ming.mak 为custom.mak, 修改custom.mak文件,定制自己要编译的选项.
* 修改编译64位vim

```
# FEATURES=[TINY | SMALL | NORMAL | BIG | HUGE]
# Set to TINY to make minimal version (few features).
FEATURES=HUGE
# Set to one of i386, i486, i586, i686 as the minimum target processor.
# For amd64/x64 architecture set ARCH=x86-64 .
ARCH=x86-64
```
* 修改编译Lua

```
# ifdef LUA
ifndef LUA
LUA=c:/Lua53
endif

ifndef DYNAMIC_LUA
DYNAMIC_LUA=yes
endif

ifndef LUA_VER
LUA_VER=53
endif

ifeq (no,$(DYNAMIC_LUA))
LUA_LIB = -L$(LUA)/lib -llua
endif

# endif
```
* 修改编译Python
```
# ifdef PYTHON

ifndef PYTHON
PYTHON=c:/Python27
endif

ifndef DYNAMIC_PYTHON
DYNAMIC_PYTHON=yes
endif

ifndef PYTHON_VER
PYTHON_VER=27
endif

ifeq (no,$(DYNAMIC_PYTHON))
PYTHONLIB=-L$(PYTHON)/libs -lpython$(PYTHON_VER)
endif
# my include files are in 'win32inc' on Linux, and 'include' in the standard
# NT distro (ActiveState)
ifeq ($(CROSS),no)
PYTHONINC=-I $(PYTHON)/include
else
PYTHONINC=-I $(PYTHON)/win32inc
endif
# endif
```
* 修改编译Python3
```
# ifdef PYTHON3
ifndef PYTHON3
PYTHON3=c:/Python34
endif

ifndef DYNAMIC_PYTHON3
DYNAMIC_PYTHON3=yes
endif

ifndef PYTHON3_VER
PYTHON3_VER=34
endif

ifeq (no,$(DYNAMIC_PYTHON3))
PYTHON3LIB=-L$(PYTHON3)/libs -lPYTHON$(PYTHON3_VER)
endif

ifeq ($(CROSS),no)
PYTHON3INC=-I $(PYTHON3)/include
else
PYTHON3INC=-I $(PYTHON3)/win32inc
endif
# endif
```
* 修改编译Ruby
```
# ifdef RUBY
ifndef RUBY
RUBY=c:/Ruby22-x64
endif
ifndef DYNAMIC_RUBY
DYNAMIC_RUBY=yes
endif
#  Set default value
ifndef RUBY_VER
RUBY_VER = 22
endif
ifndef RUBY_VER_LONG
RUBY_VER_LONG = 2.2.0
endif
ifndef RUBY_API_VER
RUBY_API_VER = $(subst .,,$(RUBY_VER_LONG))
endif

... 中间一大段默认不用设置

# endif # RUBY
```
* 这里编译和Linux下稍有不同,不需要 configue, 直接make 就可以了

**3. 开始编译**

* 开始编译运行 mingw32-make.exe -f custom.mak
* 若先前有编译失败,或要重新编译,需要先运行 mingw32-make.exe -f custom.mak clean
* 成功后在 src 文件夹下就有 Gvim.exe 文件了,可以运行看看正常不.
* 需要把 C:\Lua53\lua53.dll 文件复制到和Gvim同一文件夹下

**4. 整理打包编译好的Vim**

我查了不少资料，但没有查到相关的，就是编译好后怎么整理编译好的文件到vim包，最后我直接参考 tracyone 的编译脚本，打包了一个vim包，可以正常运行。
```
cd ~/vim-master
mkdir -p vim74-x64/vim74
cp -a runtime/* vim74-x64/vim74
cp -a src/*.exe vim74-x64/vim74
cp -a src/GvimExt/gvimext.dll vim74-x64/vim74
cp -a src/xxd/xxd.exe vim74-x64/vim74
cp -a vimtutor.bat vim74-x64/vim74
cp -a /c/Lua53/lua53.dll vim74-x64/vim74
```

**三 安装Vim74-x64**

运行管理员模式命令行，进行 Vim74-x64 文件夹，运行 install.exe
选择 d 进行默认安装。

**参考资料**

* [Windows下编译YouCompleteMe流程](http://www.cnblogs.com/tracyone/p/4735411.html)
