---
title: Atom编辑器
date: 2017-03-20 21:04:04
tags: Atom
categories: 
- Learn
- Atom

---

# Atom编辑器
[github上下载](https://github.com/atom/atom)

[TOC]

##activate-power-mode——火焰震动打字

* 效果：

![665439-3f7b322af41fe2a5.gif-2478.1kB][1]

![876c2d84-8321-11e6-8324-f1540604c0bd.gif-164.1kB][2]

**安装步骤：**

* github下载[activate-power-mode](https://github.com/JoelBesada/activate-power-mode)到***C:\Users\Administrator\.atom\packages***目录下

* 下载安装[nodejs](https://nodejs.org/en/)

* 添加nodejs的path路径，进入cmd命令窗口,执行如下命令：
`cd C:\Users\Administrator\.atom\packages\activate-power-mode`
`npm install`
![image_1bb96rhum11ratgi1j7topgfbj1e.png-8.1kB][3]
可以使用了

**使用方法：**
    `ctl+art+o`


##[vim-mode——vim编辑模式](https://atom.io/packages/vim-mode)
###[ex-mode](https://atom.io/packages/ex-mode)和[relative-numbers](https://atom.io/packages/ex-mode)
有了 vim-mode 一定要装 ex-mode 和 relative-numbers 插件，前者让编辑器完美支持 :w :s 等命令；后者可以实现常规模式下的相对行号，用 vim 的自然会懂得其重要性。
![image_1bbbihbsul081198115s15bal0g9.png-93.6kB][4]

##git——版本控制器
* git-plus—在 Atom 里面执行 Git 命令，不用来回切换终端和编辑器 
* git-control—git面板 
* tree-view-git-status—文件夹git状态 
* gist-it—快速分享代码到gist.github.com 

这里我用到——[git-plus插件](https://atom.io/packages/git-plus)

* 安装方式：
`cd C:\Users\Administrator\.atom\packages\activate-power-mode`
`npm install`

* 快捷键`ctrl+shift+H` 效果：
![image_1bbblh2n351m1jc91j3c1nb11nfa9.png-29.3kB][5]
Log显示：
![image_1bbblob5v1ne31ul01t1fkci10in13.png-81.9kB][7]



##minimap——屏幕所处相对位置
让你了解当前屏幕所处相对位置

![image_1bbbine771q9lekk1ou01cobbr2m.png-207.5kB][6]



##terminal-plus——终端控制台
Atom 中有了 terminal-plus 简直可以完全弃用系统控制台了。

`cmd+shift+t` 开启新控制台

ctrl+`      打开 /关闭 控制台
![image_1bbbio8u914fo1prfei71ukrpog13.png-168.2kB][8]

`cmd+shift+j/k` 切换控制台
![image_1bbbit6g7fbl126711mn9jh13t71g.png-244.8kB][9]


  [1]: http://static.zybuluo.com/RedFalsh/ekxo5t9n60tbh1vkxivyabd5/665439-3f7b322af41fe2a5.gif
  [2]: http://static.zybuluo.com/RedFalsh/fvdqam27ev550l64e1yw1e5e/876c2d84-8321-11e6-8324-f1540604c0bd.gif
  [3]: http://static.zybuluo.com/RedFalsh/69ncj30kezzinu4y16jm7yw3/image_1bb96rhum11ratgi1j7topgfbj1e.png
  [4]: http://static.zybuluo.com/RedFalsh/rdbnmhzewudlib0rszeemjil/image_1bbbihbsul081198115s15bal0g9.png
  [5]: http://static.zybuluo.com/RedFalsh/jng3t9shaorrnw3sky2jnq1j/image_1bbblh2n351m1jc91j3c1nb11nfa9.png
  [6]: http://static.zybuluo.com/RedFalsh/7ezo5s01cns21h0jvzts4sxo/image_1bbbine771q9lekk1ou01cobbr2m.png
  [7]: http://static.zybuluo.com/RedFalsh/aqa27dv47x7zlby1k0yqsjaj/image_1bbblob5v1ne31ul01t1fkci10in13.png
  [8]: http://static.zybuluo.com/RedFalsh/mgev5prafbblgw0hms7kzw8e/image_1bbbio8u914fo1prfei71ukrpog13.png
  [9]: http://static.zybuluo.com/RedFalsh/huajoc0d02l8qs501vrgew99/image_1bbbit6g7fbl126711mn9jh13t71g.png
