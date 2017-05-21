---
title: 我的vimrc配置文件
date: 2017-03-20 21:04:04
tags: 
- vim 
- vimrc
categories: 
- Learn
- vim 

---

##vimrc
```
filetype plugin on
syntax on

set mouse=a

set number

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %



" Mouse and backspace
set mouse=a 
set backspace=2
set backspace=indent,eol,start

"Rebind <Leader> key
let mapleader = ","

" Quicksave command
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 快速注释

" Quick quit command
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" Change window size
nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w.  :vertical resize -3<CR>
nmap    w,  :vertical resize +3<CR>
" Quickjump Window 
nmap	ww	<C-w>w
nmap    wh	<C-w>h
nmap    wj	<C-w>j
nmap    wk	<C-w>k
nmap    wl	<C-w>l
		
" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""快速插入
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"匹配括号，默认停留半秒钟
set showmatch
"set matchtime=15   "1.5秒
filetype plugin on
filetype plugin indent on

"比较文件  
nnoremap <C-F2> :vert diffsplit 

"中文设置"
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set cul "高亮光标所在行
set cuc
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set go=             " 不要图形按钮  
color desert     " 设置背景主题  
"color ron     " 设置背景主题  
"color torte     " 设置背景主题  
"set guifont=Courier_New:h10:cANSI   " 设置字体  
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
"set foldenable      " 允许折叠  
""set foldmethod=manual   " 手动折叠  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 使用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab

" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目

"markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"rkdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.py,*.cpp,*.[ch],*.sh,*.rb,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if expand("%:e") == 'py'
		call setline(1, "#!/usr/bin/python")
        call setline(2, "# coding=utf-8")
	    call setline(3, "") 
		call setline(4, "'''") 
		call setline(5, "	> File Name: ".expand("%")) 
		call setline(6, "	> Author: RedFlash") 
		call setline(7, "	> Mail: 13693421942@163.com") 
		call setline(8, "	> Created Time: ".strftime("%c")) 
		call setline(9, " '''") 
		call setline(10, "")
	endif
	if expand("%:e") == 'cpp'
		call setline(1, "#!/usr/binsdfsdfpython")
        call setline(2, "# coding=utf-8")
	endif
	
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "! java %<"
	elseif &filetype == 'sh'
		:! bash %
	elseif &filetype == 'python'
		exec "! python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "! go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc


set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'asins/vimcdoc'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
Plugin 'yggdroot/indentline'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'vimwiki/vimwiki'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'iamcco/markdown-preview.vim'
call vundle#end()            " required
filetype plugin indent on    " required

"--------------------->> markdown设置
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']



let g:table_mode_corner="|"

"noremap <Leader>e :quit<CR>
noremap <Leader>m :update<Bar>silent ! start %:p<CR>

nnoremap <f2> :!cmd /c c:\python27\python2 c:\python27\Scripts\markdown_py %:r.md -e utf-8 > %:r.html<cr> 
noremap \m  :!cmd /c start %:r.html</cr><cr></cr></f2>
	
let g:mkdp_path_to_chrome = "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
    " 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）

let g:mkdp_auto_start = 0
    " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
    " markdown 文件的时候打开一次

let g:mkdp_auto_open = 0
    " 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
    " 览窗口

let g:mkdp_auto_close = 1
    " 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
    " 自动关闭预览窗口

let g:mkdp_refresh_slow = 0
    " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
    " 更新预览
	
"--------------------->> powerline
set laststatus=2

"--------------------->> airline
let g:airline#extensions#tabline#enabled = 1

"--------------------->> ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"--------------------->> tagbar
map <C-t> :TagbarToggle<CR>

"--------------------->> vim-indentline
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_setColors = 0

"--------------------->> nerdtree
map <C-n> :NERDTreeToggle<CR>

"--------------------->> vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

"--------------------->> vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/vimwiki',
    \    'path_html': '~/vimwiki/vimwiki_html',
    \    'template_path': '~/vimwiki/template',
    \    'template_default': "/vimwiki/default.tpl"}]
	  
map <F4> :Vimwiki2HTML<cr>  
	
"------------- PYTHON-IDE----------------------------



"--------------------->> jedi-vim
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

"--------------------->> python-mode

map <Leader>g :call RopeGotoDefinition()<CR>

let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0

"turn on code checking
""let g:pymode_lint = 1
"Check code on every save (if file has been modified)
""let g:pymode_lint_on_write = 1
"Check code on every save (every)
""let g:pymode_lint_unmodified = 1

"Enable functionality
""let g:pymode_breakpoint = 1

"turn on code completion support in the plugin
""let g:pymode_rope_completion = 1
""let g:pymode_rope_autoimport = 0
let g:pymode_doc = 1

let g:pymode_doc_bind = 'K'
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"verilog 单词缩写"
iabbrev mo module
iabbrev in input
iabbrev ou output
iabbrev al always
iabbrev po posedge
iabbrev ne negedge
iabbrev def defparam
iabbrev as assign
iabbrev ini initial
iabbrev ## //################################################
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions+=b

```

