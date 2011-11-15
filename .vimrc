" vimrc file
" Author: Konrad Markus <konker@gmail.com>
"

set nocompatible

set bs=2             " allow backspacing over everything in insert mode
set ai               " always set autoindenting on
set viminfo='20,\"50 " read/write a .viminfo file, don't store more
                     " than 50 lines of registers

set history=100      " keep 100 lines of command line history
set ruler            " show the cursor position all the time

" Tabs and end of lines
set ts=4
set sw=4
set expandtab
set eol "unix"

" Encoding
if has("multi_byte")
     set encoding=utf-8
     setglobal fileencoding=utf-8
     set nobomb
     set termencoding=iso-8859-15
     set fileencodings=ucs-bom,iso-8859-15,iso-8859-3,utf-8
else
     echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif 

" Keep these out of the working directory. Need to be created manually
" May be clash of backups of two files with the same name?
set dir=~/vim.swap
set backupdir=~/vim.backup

" Remove toolbar and set font
set guioptions-=T 
set guifont=Andale_Mono:h13

" switch on tags and specify tags file.
" ; at the end means the search will traverse up the directory tree
filetype plugin on
set tags=./.tags;

" gentags shell script called before starting vim
" see http://github.com/konker/rcfiles
call system("~/bin/gentags")

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Highlight trailing whitespace
highlight Visual guibg=Grey
highlight ExtraWhitespace ctermbg=lightgreen guibg=lightgreen

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " ruby standard 2 spaces, always
  autocmd BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2 
  autocmd BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2 

endif " has("autocmd")

