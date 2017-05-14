---
title: pyqt-qtableview使用
date: 2017-03-20 21:04:04
tags: Python
categories: 
- Learn
- Python

---
参考链接
* [PyQt5 Reference Guide](http://pyqt.sourceforge.net/Docs/PyQt5/)

* [QTableView Class](http://doc.qt.io/qt-5/qtableview.html)
* [PyQT——QTableView的使用](http://blog.csdn.net/sollor525/article/details/40048089)

## 表格初始化
QStandardItem 
## 常用函数使用方法及说明
* **返回总行数**
`model.rowCount()`
* **返回总列数**
`model.columnCount()`
* **返回第i列表头内容**
`model.headerData(i,Qt.Horizontal)`
* **返回第row行，第column列内容**
`model.data(model.index(row, column))`
* **移除某行**
`model.removeRow(row)`
* **插入新行**
`model.insertRow(row)`

## 信号响应类
* **使用方法：**
1.信号绑定函数
`self.doubleClicked.connect(self.yourfunc)`
2.重写信号函数
```
def doubleClicked(self, *args, **kwargs):
    ...
    ...
    ...
```

## 颜色设置
* **设置字体颜色**
`self.model.item(8,0).setForeground(QBrush(QColor(255, 0, 0)))`

* **设置背景颜色**
`self.model.item(8,0).setBackground(QBrush(QColor("red")))`
