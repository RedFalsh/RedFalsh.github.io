---
title: vim--窗口设置
date: 2017-03-20 21:04:04
tags:
- vim
- vimrc
categories:
- Learn
- vim

---

## 工具栏和菜单栏设置

`.vimrc`文件中添加如下:

```
"Toggle Menu and Toolbar
set guioptions-=m "隐藏菜单栏
set guioptions-=T "隐藏工具栏
map <silent> <F12> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
```

`set guioptions-=m`
`set guioptions-=T`

## gvim开启时自动最大化

如果你是Unix/Linux,在vimrc里添加

```
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif
```

如果你是windows的GVim，在_vimrc里添加

`autocmd GUIEnter * simalt ~x`

## 各窗口之间跳转

```

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

```

## 改变各个窗口的大小
```
" 增加宽度
map <leader>= :resize +3<CR>
" 减少宽度
map <leader>- :resize -3<CR>
" 减少高度
map <leader>[ :vertical resize -3<CR>
" 增加高度
map <leader>] :vertical resize +3<CR>

map <leader><leader>= :resize +6<CR>
map <leader><leader>- :resize -6<CR>
map <leader><leader>[ :vertical resize -6<CR>
map <leader><leader>] :vertical resize +6<CR>

```
