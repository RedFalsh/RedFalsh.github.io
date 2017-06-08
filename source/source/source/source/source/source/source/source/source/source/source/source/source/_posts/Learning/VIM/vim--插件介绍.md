---
title: vim--插件介绍
date: 2017-03-20 21:04:04
tags:
- vim
- vimrc
categories:
- Learn
- vim

---

## kshenoy/vim-signature

### 功能

vim-signature是一个用于放置，切换和显示标记的插件。
除了上述之外，你也可以
* 按位置/字母顺序向前/向后浏览
* 显示多个标记（最多2个，由标志特征限制）
* 放置自定义的符号！@＃$％^＆*（）作为视觉标记

### 安装
`Bundle "kshenoy/vim-signature"`

### 使用

```
m[a-zA-Z]   打标签
'[a-zA-Z]   跳转到标签位置

'.          最后一次变更的地方
''          跳回来的地方(最近两个位置跳转)

m<space>    去除所有标签

```
