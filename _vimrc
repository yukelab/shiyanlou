set encoding=utf-8
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
autocmd GUIEnter * simalt ~x 
set diffexpr=MyDiff()
"*****************************************************
"                   一般性Config                      *
"*****************************************************
" 关闭vim一致性原则
set nocompatible
" 显示行号
set nu
" 设置在编辑过程中右下角显示光标的行列信息
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 设置历史记录条数
set history=1000
" 设置取消备份，禁止临时文件的生成
set noswapfile
set nobackup
" 禁止生成unfile
set noundofile
" 设置匹配模式
set showmatch
set lines=35 columns=128
" 设置C/C++自动对齐方式
set autoindent
set cindent 
" 开启语法高亮
syntax enable
syntax on
" Configbackspace的工作方式
set backspace=indent,eol,start
" 选中高亮
set hls
" 高亮光标所在行
"set cul "cursorline
" set cursorcolumn
set cursorline
" 设置背景主题
color desert
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
"autocmd InsertEnter * se cul    " 用浅色高亮当前行  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
" 光标移动到buffer的顶部和底部时保持3行距离  
set scrolloff=3
" 总是显示状态行
" set cmdheight=1
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
"set foldmethod=syntax   " 用语法高亮来折叠
set foldmethod=manual   " 手动折叠  
"set magic                   " 设置魔术
"set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏
let g:indentLine_char = '┊'
"启动时不显示帮助乌干达儿童提示
set shortmess=atI 
" 不要图形按钮 
set go=           
"设置在vim中可以使用鼠标
" set mouse=a
"设置tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置退格键时可以删除4个空格
set smarttab
set softtabstop=4
"将tab键自动转换为空格
" set expandtab
"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试以下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"设置字体和大小
set guifont=Courier_new:h14:cDEFAULT
"检测文件类型
filetype on
"针对不同的文件采取不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on
"
set matchpairs=(:),{:},[:]
" 设置自动补全括号
" inoremap ( ()<ESC>
" inoremap [ []<ESC>
" inoremap { {}<ESC>
" inoremap < <><ESC>
" 设置用%%代替%:h在cmd窗口添加本文件所在目录
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" disable arrow key in vim
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
" 按缩进显示折叠
 set fdm=indent
" 显示tab和空格
set list
" 设置tab和空格样式
set lcs=tab:\|\ ,nbsp:%,trail:-
" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首tab
match LeaderTab /^\t/
" --------------------------------------------------
" [参考线切换] {{{
" --------------------------------------------------
" fu! ReferenceLine(t)
"     if exists('w:ccnum')
"         let ccnum=w:ccnum
"     elsei exists('b:ccnum')
"         let ccnum=b:ccnum
"     else
"         let ccnum=0
"     en
"     let oldcc=ccnum
"     " let ccc=&cc
"     " ec oldcc
"     let ccc=','.&cc.','
"     " add/sub
"     if a:t=='add' || a:t=='sub'
"         " check old cc
"         if match(ccc, ','.oldcc.',')<0
"             let oldcc=0
"             let ccnum=0
"         en
"         " step
"         let csw=&sw
"         if a:t=='add'
"             let ccnum=ccnum + csw
"         elsei a:t=='sub'
"             let ccnum=ccnum - csw
"             if ccnum < 0 | let ccnum=0 | en
"         en
"         if oldcc > 0 | let ccc=substitute(ccc, ','.oldcc.',', ',', '') | en
"         let ccc=ccc.ccnum
"         " ec ccc
"         " ec ccnum
"         let ccc=substitute(ccc, '^0,\|,0,\|,0$', ',', 'g')
"         let ccc=substitute(ccc, '^,\+\|,\+$', '', 'g')
"         " ec ccc
"         let w:ccnum=ccnum
"         let b:ccnum=ccnum
"         exec "setl cc=".ccc
"     " del
"     elsei a:t=='del'
"         let ccc=substitute(ccc, ','.oldcc.',', ',', '')
"         let ccc=substitute(ccc, '^,\+\|,\+$', '', 'g')
"         " ec ccc
"         let w:ccnum=0
"         let b:ccnum=0
"         exec "setl cc=".ccc
"     en
" endf
" nn <silent> <A-u> :call ReferenceLine('sub')<CR>
" nn <silent> <A-o> :call ReferenceLine('add')<CR>
"*****************************************************
"                   vundleConfig                      *
"*****************************************************
set rtp+=$Vim/vimfiles/bundle/Vundle/
call vundle#rc('$VIM/vimfiles/bundle/')  
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'  
Bundle 'taglist.vim'
Bundle 'drmingdrmer/xptemplate'
Bundle 'The-NERD-tree'
Bundle 'Syntastic'
Bundle 'bufexplorer.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'DoxygenToolkit.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'Valloric/YouCompleteMe'
Bundle "godlygeek/tabular"
Bundle 'tComment'
Bundle 'terryma/vim-multiple-cursors' 
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
" Bundle 'tpope/vim-bundle'
Bundle 'tpope/vim-fugitive'
"*****************************************************
"                   taglist Config                      *
"*****************************************************
"生成tag文件
nnoremap <F5> :!ctags -R<CR>
"不显示"press F1 to display help"
let Tlist_Compact_Format=1
"窗口在左侧显示
let Tlist_Use_Right_Window=1
"只显示当前文件的tags
let Tlist_Show_One_File=1  
"高亮显示
let Tlist_Auto_Highlight_tag=1
"随文件自动更新
let Tlist_Auto_Update=1
"设置宽度
let Tlist_WinWidth=30       
"taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow=1 
"单击跳转
let Tlist_Use_SingClick=1
"打开关闭快捷键
nnoremap <silent> <F3> :TlistToggle<CR>

"********************************************************
"                      NERD_Tree Config                   *
"********************************************************
"显示增强
let NERDChristmasTree=1
"自动调整焦点
let NERDTreeAutoCenter=1
"鼠标模式:目录单击,文件双击
let NERDTreeMouseMode=2
"打开文件后自动关闭
let NERDTreeQuitOnOpen=0
"显示文件
let NERDTreeShowFiles=1
"显示隐藏文件
let NERDTreeShowHidden=0
"高亮显示当前文件或目录
let NERDTreeHightCursorline=1
"显示行号
let NERDTreeShowLineNumbers=1
"窗口位置
let NERDTreeWinPos='left'
"窗口宽度
let NERDTreeWinSize=31
"不显示'Bookmarks' label 'Press ? for help'
let NERDTreeMinimalUI=1
" 忽略一下文件的显示
" let NERDTreeIgnore=['\.abcd','.dep','.I$[[file]]','.b$[[file]]','.lib','.ini','.uv$[[file]]','tags','JLinkLog.txt','.P$[[file]]','.p$[[file]]']
let NERDTreeIgnore=['\.uvproj','\.IAD','\.IAB','\.IMB','\.IMD','\.hex','\.po','.lib','.ini','\.abcd','.dep','.bak','tags']
"快捷键
nnoremap <silent> <F2> :NERDTreeToggle<CR>
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:winManagerWindowLayout = "FileExplorer|TagList"

"*****************************************************
"           winManagerConfig                        *
"*****************************************************
" 设置界面分割
" let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
" 设置winManage的宽度，默认为25
let g:winManagerWidth = 30
" 定义打开winmanage按键
nmap <silent> <F8> :WMToggle<cr>

"*****************************************************
"           YouCompleteMeConfig                        *
"*****************************************************
let Python27="D:\Python27/"
let $PYTHONPATH=Python27."DLLs;".Python27."Lib;".Python27."Lib/lib-tk;".Python27."Lib/plat-win;".Python27."Lib/site-packages"
set runtimepath+=D:/Vim/vimfiles/bundle/YouCompleteMe
"Config默认的ycm_extra_conf.py
" let g:ycm_global_ycm_extra_conf = 'D:\02_Projects\004_handBand\02_Software\qf_board\uart'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>'
" 从第一个键入项就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 在注释中输入也能补全
" let g:ycm_complete_in_comments=1
" 在字符串输入中也能补全
" let g:ycm_complete_in_strings=1
" 开启YCM基于标签引擎
" let g:ycm_collect_identifiers_from_tag_files=1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_tag_comments_and_files=1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"leader映射为逗号“，”
let mapleader = ","  
"打开vim时不再询问是否加载ycm_extra_conf.pyConfig
let g:ycm_confirm_extra_conf=0   

"按gd 会跳转到声明
" nnoremap <silent> gd :YcmCompleter GoToDeclaration<CR>   
"按gf 会跳转到定义
" nnoremap <silent> gf :YcmCompleter GoToDefinition<CR>   
"按gb 会跳转到定义或者声明
nnoremap <silent> gb :YcmCompleter GoToDefinitionElseDeclaration<CR>   
"使用ctags生成的tags文件
map <F4> : YcmDiags<CR>
"*****************************************************
"           Syntastic Config                        *
"*****************************************************
"*****************************************************
"           bufexplorer Config                        *
"*****************************************************
let g:bufExplorerSortBy='extension'  " Sort by file extension.
"********************************************************
"               DoxgenToolkit Config                   *
"********************************************************
let g:DoxgenToolkit_commentType='C'
let g:DoxygenToolkit_briefTag_funcName = "yes"

" for C style, change the '@' to '\'
let g:DoxygenToolkit_briefTag_pre = "\\brief "
let g:DoxygenToolkit_templateParamTag_pre = "\\tparam "
let g:DoxygenToolkit_paramTag_pre = "\\param "
let g:DoxygenToolkit_returnTag = "\\return "
let g:DoxygenToolkit_fileTag = "\\file "
let g:DoxygenToolkit_dateTag = "\\date "
let g:DoxygenToolkit_authorTag = "\\author "
let g:DoxygenToolkit_versionTag = "\\version "
let g:DoxygenToolkit_blockTag = "\\name "
let g:DoxygenToolkit_authorName = "liqi, yukelab7@gmail.com"
let g:doxygen_enhanced_color = 1
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 

"********************************************************
"               unimpaired.vim Config                   *
"********************************************************
" nnoremap <silent> [b :bprevious
" nnoremap <silent> ]b :bnext
" nnoremap <silent> [B :bfirst
" nnoremap <silent> ]B :blast

"*****************************************************
"新文件标题                                          *
"*****************************************************
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding=utf-8 -*-")
        call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."),   "  > File Name   : ".expand("%")) 
        call append(line(".")+1, "  > Author      : yukelab") 
        call append(line(".")+2, "  > Mail        : yuke_1412@163.com") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G
"*****************************************************
"代码格式优化化                                      *
"*****************************************************

map <F6> :call FormartSrc()<CR><CR>
"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

