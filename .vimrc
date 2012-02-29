" vimrc file
" Author: Konrad Markus <konker@gmail.com>


" Vundle
" ============================================================================
set nocompatible
filetype off
let $GIT_SSL_NO_VERIFY = 'true'

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" plugin bundles
" ---------------------------------------------------------------------------- 

" ui and commands
Bundle 'tpope/vim-fugitive'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Solarized'

" languages
Bundle 'python.vim'
Bundle 'Python-Syntax'
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'
Bundle 'VimOrganizer'
Bundle 'Puppet-Syntax-Highlighting'


" plugin configs
" ---------------------------------------------------------------------------- 
" Powerline
let g:Powerline_symbols = 'fancy'

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on


" Text format
" ============================================================================ 
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start  " more powerful backspacing
set cindent
set autoindent
set smarttab
set expandtab
set wrap
set textwidth=0
set tildeop

set formatoptions-=c
set formatoptions-=o " Do not automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set formatoptions-=r " Do not automatically insert a comment leader after an enter
set formatoptions-=t " Do no auto-wrap text using textwidth (does not apply to comments)


" Encoding
" ============================================================================ 
if has("multi_byte")
     set encoding=utf-8
     setglobal fileencoding=utf-8
     set nobomb
     set termencoding=utf-8
     set fileencodings=utf-8,ucs-bom,iso-8859-15,iso-8859-3
else
     echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif 


" Colour and UI
" ============================================================================ 
set background=dark

try
    colorscheme jellybeans
catch /./
    " ignore
endtry

set t_Co=256
set ruler
set nonumber
set laststatus=2

" highlight trailing whitespace
highlight Visual guibg=Grey
highlight ExtraWhitespace ctermbg=lightgreen guibg=lightgreen

set showmatch  " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" no noise or blinking
set noerrorbells visualbell t_vb=
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping

" gui options
set guioptions-=T 
if has("gui_gtk2")
     set guifont=Inconsolata\ 12
elseif has("gui_macvim")
    set guifont=Inconsolata-dz\ for\ Powerline:h13
elseif has("gui_win32")
    set guifont=Inconsolata-dz\ for\ Powerline:h12
end


" Backups
" ============================================================================ 
set nowritebackup
set nobackup
set directory=/tmp//,$HOME/.tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set hidden

" Behaviour
" ============================================================================ 
syntax enable
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 


" Search
" ============================================================================ 
set ignorecase " Case insensitive search
set smartcase " Non-case sensitive search when there is a capital letter
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache


" Tags
" ============================================================================ 
" gentags shell script called before starting vim
" see http://github.com/konker/rcfiles
call system("~/bin/gentags")

" switch on tags and specify tags file.
" ; at the end means the search will traverse up the directory tree
set tags=.tags;/


" Autocmd
" ============================================================================ 
if has("autocmd")

    " ruby standard 2 spaces, always
    autocmd BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2 
    autocmd BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2 
    
    " pythonm fold on indent
    autocmd BufRead,BufNewFile *.py set foldmethod=indent

endif " has("autocmd")

