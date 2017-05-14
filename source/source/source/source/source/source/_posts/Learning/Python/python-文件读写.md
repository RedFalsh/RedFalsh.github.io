---
title: python-文件读写
date: 2017-05-12 13:48:27 
tags: Python
categories: 
- Learn
- Python

---


参考:

[廖雪峰-文件读写](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386820066616a77f826d876b46b9ac34cb5f34374f7a000)


# 读文件

```
with open('%s'%file_path,'r') as f:
    print(f.read())
```

## 读二进制文件

```
with open('%s'%file_path,'rb') as f:
    print(f.read())

```

## 字符编码

要读取非ASCII编码的文本文件，就必须以二进制模式打开，再解码。比如GBK编码的文件：
```
f = open('/Users/michael/gbk.txt', 'rb')
u = f.read().decode('gbk')
print(u)

```

如果每次都这么手动转换编码嫌麻烦（写程序怕麻烦是好事，不怕麻烦就会写出又长又难懂又没法维护的代码），Python还提供了一个codecs模块帮我们在读文件时自动转换编码，直接读出unicode：
```
import codecs
with codecs.open('/Users/michael/gbk.txt', 'r', 'gbk') as f:
    f.read() # u'\u6d4b\u8bd5'
```

# 写文件

```
with open('%s'%file_path,'w') as f:
    f.write('write some information')
```
## 其他写入方式,参考读写文件即可,举一反三
