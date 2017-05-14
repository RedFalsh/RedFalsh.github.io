let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <S-Tab> <Plug>SuperTabBackward
inoremap <C-Tab> 	
map! <S-Insert> *
map  ggVGY
vmap  "+y
map  :NERDTreeToggle
nnoremap <silent>  :CtrlP
nnoremap  :update
vnoremap  :update
onoremap  :update
map  :TagbarToggle
vmap  "*d
noremap ,m :update|silent ! start %:p
nmap <silent> ,ww <Plug>VimwikiIndex
nmap <silent> ,wt <Plug>VimwikiTabIndex
nmap <silent> ,ws <Plug>VimwikiUISelect
nmap <silent> ,wi <Plug>VimwikiDiaryIndex
nmap <silent> ,w,i <Plug>VimwikiDiaryGenerateLinks
nmap <silent> ,w,w <Plug>VimwikiMakeDiaryNote
nmap <silent> ,w,t <Plug>VimwikiTabMakeDiaryNote
nmap <silent> ,w,y <Plug>VimwikiMakeYesterdayDiaryNote
map ,g :call RopeGotoDefinition()
map ,b Oimport ipdb; ipdb.set_trace() # BREAKPOINT
noremap ,E :qa!
noremap ,e :quit
nmap \ \cc
vmap \ \cc
noremap \m :!cmd /c start %:r.html</cr></cr></f2>
nmap fi :!firefox %.html & 
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nmap md :!~/.vim/markdown.pl % > %.html 
nmap tt :%s/\t/    /g
nmap wl l
nmap wk k
nmap wj j
nmap wh h
nmap ww w
nmap w, :vertical resize +3
nmap w. :vertical resize -3
nmap w- :resize -3
nmap w= :resize +3
nnoremap <F2> :!cmd /c c:\python27\python2 c:\python27\Scripts\markdown_py %:r.md -e utf-8 > %:r.html 
map <F4> :Vimwiki2HTML  
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
map <F5> :call CompileRunGcc()
nnoremap <C-F2> :vert diffsplit 
vmap <C-Del> "*d
vmap <S-Del> "*d
vmap <C-Insert> "*y
vmap <S-Insert> "-d"*P
nmap <S-Insert> "*P
map!  ggVGY
inoremap  
imap 	 <Plug>SuperTabForward
inoremap <silent> <NL> =OmniPopup('j')
inoremap <silent>  =OmniPopup('k')
inoremap  :update
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set cindent
set cmdheight=2
set completeopt=longest,menuone
set encoding=utf-8
set expandtab
set fileencodings=utf8,gbk,gb2312,gb18030
set guioptions=b
set helplang=cn
set hlsearch
set incsearch
set langmenu=zh_CN.UTF-8
set laststatus=2
set ruler
set runtimepath=~/vimfiles,~\\.vim\\bundle\\Vundle.vim,~\\.vim\\bundle\\vimcdoc,~\\.vim\\bundle\\vim-fugitive,~\\.vim\\bundle\\L9,~\\.vim\\bundle\\command-t,~\\.vim\\bundle\\plugin,~\\.vim\\bundle\\vim-powerline,~\\.vim\\bundle\\vim-airline,~\\.vim\\bundle\\indentline,~\\.vim\\bundle\\supertab,~\\.vim\\bundle\\ctrlp.vim,~\\.vim\\bundle\\tagbar,~\\.vim\\bundle\\nerdtree,~\\.vim\\bundle\\vim-colors-solarized,~\\.vim\\bundle\\jedi-vim,~\\.vim\\bundle\\python-mode,~\\.vim\\bundle\\vimwiki,~\\.vim\\bundle\\tabular,~\\.vim\\bundle\\vim-markdown,C:\\vim80-x64/vimfiles,C:\\vim80-x64\\vim80,C:\\vim80-x64/vimfiles/after,~/vimfiles/after,~/.vim/bundle/Vundle.vim,~\\.vim\\bundle\\Vundle.vim/after,~\\.vim\\bundle\\vimcdoc/after,~\\.vim\\bundle\\vim-fugitive/after,~\\.vim\\bundle\\L9/after,~\\.vim\\bundle\\command-t/after,~\\.vim\\bundle\\plugin/after,~\\.vim\\bundle\\vim-powerline/after,~\\.vim\\bundle\\vim-airline/after,~\\.vim\\bundle\\indentline/after,~\\.vim\\bundle\\supertab/after,~\\.vim\\bundle\\ctrlp.vim/after,~\\.vim\\bundle\\tagbar/after,~\\.vim\\bundle\\nerdtree/after,~\\.vim\\bundle\\vim-colors-solarized/after,~\\.vim\\bundle\\j
set scrolloff=3
set shiftround
set shiftwidth=4
set showmatch
set showtabline=2
set smarttab
set softtabstop=4
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set noswapfile
set tabline=%!airline#extensions#tabline#get()
set tabstop=4
set window=39
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~\blog\source
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 session.vim
badd +1 _posts\MyJob\调试问题记录.md
badd +74 _posts\MyJob\工作报告2017.md
argglobal
silent! argdel *
argadd session.vim
edit _posts\MyJob\工作报告2017.md
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 69 + 85) / 170)
exe 'vert 2resize ' . ((&columns * 100 + 85) / 170)
argglobal
let s:cpo_save=&cpo
set cpo&vim
vmap <buffer> [] <Plug>Markdown_MoveToPreviousSiblingHeader
nmap <buffer> [] <Plug>Markdown_MoveToPreviousSiblingHeader
vmap <buffer> [[ <Plug>Markdown_MoveToPreviousHeader
nmap <buffer> [[ <Plug>Markdown_MoveToPreviousHeader
vmap <buffer> ]c <Plug>Markdown_MoveToCurHeader
nmap <buffer> ]c <Plug>Markdown_MoveToCurHeader
vmap <buffer> ]u <Plug>Markdown_MoveToParentHeader
nmap <buffer> ]u <Plug>Markdown_MoveToParentHeader
vmap <buffer> ][ <Plug>Markdown_MoveToNextSiblingHeader
nmap <buffer> ][ <Plug>Markdown_MoveToNextSiblingHeader
vmap <buffer> ]] <Plug>Markdown_MoveToNextHeader
nmap <buffer> ]] <Plug>Markdown_MoveToNextHeader
vmap <buffer> ge <Plug>Markdown_EditUrlUnderCursor
nmap <buffer> ge <Plug>Markdown_EditUrlUnderCursor
vmap <buffer> gx <Plug>Markdown_OpenUrlUnderCursor
nmap <buffer> gx <Plug>Markdown_OpenUrlUnderCursor
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=b:*,b:+,b:-,b:>
setlocal commentstring=>\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
set cursorcolumn
setlocal cursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'markdown'
setlocal filetype=markdown
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=Foldexpr_markdown(v:lnum)
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=expr
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tqlnr
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\|^[-*+]\\s\\+\\|^\\[^\\ze[^\\]]\\+\\]:
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetMarkdownIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,128-167,224-235
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=htmlcomplete#CompleteTags
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'markdown'
setlocal syntax=markdown
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 76 - ((14 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
76
normal! 0
wincmd w
argglobal
edit _posts\MyJob\调试问题记录.md
let s:cpo_save=&cpo
set cpo&vim
vmap <buffer> [] <Plug>Markdown_MoveToPreviousSiblingHeader
nmap <buffer> [] <Plug>Markdown_MoveToPreviousSiblingHeader
vmap <buffer> [[ <Plug>Markdown_MoveToPreviousHeader
nmap <buffer> [[ <Plug>Markdown_MoveToPreviousHeader
vmap <buffer> ]c <Plug>Markdown_MoveToCurHeader
nmap <buffer> ]c <Plug>Markdown_MoveToCurHeader
vmap <buffer> ]u <Plug>Markdown_MoveToParentHeader
nmap <buffer> ]u <Plug>Markdown_MoveToParentHeader
vmap <buffer> ][ <Plug>Markdown_MoveToNextSiblingHeader
nmap <buffer> ][ <Plug>Markdown_MoveToNextSiblingHeader
vmap <buffer> ]] <Plug>Markdown_MoveToNextHeader
nmap <buffer> ]] <Plug>Markdown_MoveToNextHeader
vmap <buffer> ge <Plug>Markdown_EditUrlUnderCursor
nmap <buffer> ge <Plug>Markdown_EditUrlUnderCursor
vmap <buffer> gx <Plug>Markdown_OpenUrlUnderCursor
nmap <buffer> gx <Plug>Markdown_OpenUrlUnderCursor
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=b:*,b:+,b:-,b:>
setlocal commentstring=>\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
set cursorcolumn
setlocal cursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'markdown'
setlocal filetype=markdown
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=Foldexpr_markdown(v:lnum)
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=expr
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tqlnr
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\|^[-*+]\\s\\+\\|^\\[^\\ze[^\\]]\\+\\]:
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetMarkdownIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,128-167,224-235
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=htmlcomplete#CompleteTags
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!Pl#Statusline(0,1)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'markdown'
setlocal syntax=markdown
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 40 - ((30 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
40
normal! 024|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 69 + 85) / 170)
exe 'vert 2resize ' . ((&columns * 100 + 85) / 170)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
