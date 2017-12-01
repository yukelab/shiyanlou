set encoding=utf-8
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
autocmd GUIEnter * simalt ~x 
set diffexpr=MyDiff()
"*****************************************************
"                   һ����Config                      *
"*****************************************************
" �ر�vimһ����ԭ��
set nocompatible
" ��ʾ�к�
set nu
" �����ڱ༭���������½���ʾ����������Ϣ
set ruler
" ��״̬����ʾ�������������
set showcmd
" ������ʷ��¼����
set history=1000
" ����ȡ�����ݣ���ֹ��ʱ�ļ�������
set noswapfile
set nobackup
" ��ֹ����unfile
set noundofile
" ����ƥ��ģʽ
set showmatch
set lines=35 columns=128
" ����C/C++�Զ����뷽ʽ
set autoindent
set cindent 
" �����﷨����
syntax enable
syntax on
" Configbackspace�Ĺ�����ʽ
set backspace=indent,eol,start
" ѡ�и���
set hls
" �������������
"set cul "cursorline
" set cursorcolumn
set cursorline
" ���ñ�������
color desert
"autocmd InsertLeave * se nocul  " ��ǳɫ������ǰ��  
"autocmd InsertEnter * se cul    " ��ǳɫ������ǰ��  
"set whichwrap+=<,>,h,l   " ����backspace�͹�����Խ�б߽�(������)  
" ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���  
set scrolloff=3
" ������ʾ״̬��
" set cmdheight=1
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=1    " ������ʾ״̬��(1),������ʾ״̬��(2)  
set foldenable      " �����۵�  
"set foldmethod=syntax   " ���﷨�������۵�
set foldmethod=manual   " �ֶ��۵�  
"set magic                   " ����ħ��
"set guioptions-=T           " ���ع�����
"set guioptions-=m           " ���ز˵���
let g:indentLine_char = '��'
"����ʱ����ʾ�����ڸɴ��ͯ��ʾ
set shortmess=atI 
" ��Ҫͼ�ΰ�ť 
set go=           
"������vim�п���ʹ�����
" set mouse=a
"����tab���
set tabstop=4
"�����Զ�����ո���
set shiftwidth=4
"�����˸��ʱ����ɾ��4���ո�
set smarttab
set softtabstop=4
"��tab���Զ�ת��Ϊ�ո�
" set expandtab
"���ñ��뷽ʽ
set encoding=utf-8
"�Զ��жϱ���ʱ ���γ������±���
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"��������ʹ�С
set guifont=Courier_new:h14:cDEFAULT
"����ļ�����
filetype on
"��Բ�ͬ���ļ���ȡ��ͬ��������ʽ
filetype indent on
"������
filetype plugin on
"�������ܲ�ȫ
filetype plugin indent on
"
set matchpairs=(:),{:},[:]
" �����Զ���ȫ����
" inoremap ( ()<ESC>
" inoremap [ []<ESC>
" inoremap { {}<ESC>
" inoremap < <><ESC>
" ������%%����%:h��cmd������ӱ��ļ�����Ŀ¼
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" disable arrow key in vim
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
" ��������ʾ�۵�
 set fdm=indent
" ��ʾtab�Ϳո�
set list
" ����tab�Ϳո���ʽ
set lcs=tab:\|\ ,nbsp:%,trail:-
" �趨����tabΪ��ɫ
highlight LeaderTab guifg=#666666
" ƥ������tab
match LeaderTab /^\t/
" --------------------------------------------------
" [�ο����л�] {{{
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
"����tag�ļ�
nnoremap <F5> :!ctags -R<CR>
"����ʾ"press F1 to display help"
let Tlist_Compact_Format=1
"�����������ʾ
let Tlist_Use_Right_Window=1
"ֻ��ʾ��ǰ�ļ���tags
let Tlist_Show_One_File=1  
"������ʾ
let Tlist_Auto_Highlight_tag=1
"���ļ��Զ�����
let Tlist_Auto_Update=1
"���ÿ��
let Tlist_WinWidth=30       
"taglist���������һ�����ڣ����˳�vim
let Tlist_Exit_OnlyWindow=1 
"������ת
let Tlist_Use_SingClick=1
"�򿪹رտ�ݼ�
nnoremap <silent> <F3> :TlistToggle<CR>

"********************************************************
"                      NERD_Tree Config                   *
"********************************************************
"��ʾ��ǿ
let NERDChristmasTree=1
"�Զ���������
let NERDTreeAutoCenter=1
"���ģʽ:Ŀ¼����,�ļ�˫��
let NERDTreeMouseMode=2
"���ļ����Զ��ر�
let NERDTreeQuitOnOpen=0
"��ʾ�ļ�
let NERDTreeShowFiles=1
"��ʾ�����ļ�
let NERDTreeShowHidden=0
"������ʾ��ǰ�ļ���Ŀ¼
let NERDTreeHightCursorline=1
"��ʾ�к�
let NERDTreeShowLineNumbers=1
"����λ��
let NERDTreeWinPos='left'
"���ڿ��
let NERDTreeWinSize=31
"����ʾ'Bookmarks' label 'Press ? for help'
let NERDTreeMinimalUI=1
" ����һ���ļ�����ʾ
" let NERDTreeIgnore=['\.abcd','.dep','.I$[[file]]','.b$[[file]]','.lib','.ini','.uv$[[file]]','tags','JLinkLog.txt','.P$[[file]]','.p$[[file]]']
let NERDTreeIgnore=['\.uvproj','\.IAD','\.IAB','\.IMB','\.IMD','\.hex','\.po','.lib','.ini','\.abcd','.dep','.bak','tags']
"��ݼ�
nnoremap <silent> <F2> :NERDTreeToggle<CR>
"����vim��û���ļ�ʱ�Զ���NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"ֻʣ NERDTreeʱ�Զ��ر�
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:winManagerWindowLayout = "FileExplorer|TagList"

"*****************************************************
"           winManagerConfig                        *
"*****************************************************
" ���ý���ָ�
" let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
" ����winManage�Ŀ�ȣ�Ĭ��Ϊ25
let g:winManagerWidth = 30
" �����winmanage����
nmap <silent> <F8> :WMToggle<cr>

"*****************************************************
"           YouCompleteMeConfig                        *
"*****************************************************
let Python27="D:\Python27/"
let $PYTHONPATH=Python27."DLLs;".Python27."Lib;".Python27."Lib/lib-tk;".Python27."Lib/plat-win;".Python27."Lib/site-packages"
set runtimepath+=D:/Vim/vimfiles/bundle/YouCompleteMe
"ConfigĬ�ϵ�ycm_extra_conf.py
" let g:ycm_global_ycm_extra_conf = 'D:\02_Projects\004_handBand\02_Software\qf_board\uart'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>'
" �ӵ�һ��������Ϳ�ʼ����ƥ����
let g:ycm_min_num_of_chars_for_completion=1
" ��ע��������Ҳ�ܲ�ȫ
" let g:ycm_complete_in_comments=1
" ���ַ���������Ҳ�ܲ�ȫ
" let g:ycm_complete_in_strings=1
" ����YCM���ڱ�ǩ����
" let g:ycm_collect_identifiers_from_tag_files=1
" ע�ͺ��ַ����е�����Ҳ�ᱻ���벹ȫ
let g:ycm_collect_identifiers_from_tag_comments_and_files=1
" �﷨�ؼ��ֲ�ȫ
let g:ycm_seed_identifiers_with_syntax=1
"leaderӳ��Ϊ���š�����
let mapleader = ","  
"��vimʱ����ѯ���Ƿ����ycm_extra_conf.pyConfig
let g:ycm_confirm_extra_conf=0   

"��gd ����ת������
" nnoremap <silent> gd :YcmCompleter GoToDeclaration<CR>   
"��gf ����ת������
" nnoremap <silent> gf :YcmCompleter GoToDefinition<CR>   
"��gb ����ת�������������
nnoremap <silent> gb :YcmCompleter GoToDefinitionElseDeclaration<CR>   
"ʹ��ctags���ɵ�tags�ļ�
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
"���ļ�����                                          *
"*****************************************************
"�½�.c,.h,.sh,.java�ļ����Զ������ļ�ͷ 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""���庯��SetTitle���Զ������ļ�ͷ 
func SetTitle() 
    "����ļ�����Ϊ.sh�ļ� 
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
    "�½��ļ����Զ���λ���ļ�ĩβ
endfunc 
autocmd BufNewFile * normal G
"*****************************************************
"�����ʽ�Ż���                                      *
"*****************************************************

map <F6> :call FormartSrc()<CR><CR>
"����FormartSrc()
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
"��������FormartSrc

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

