" vimrc file

" Author: Konrad Markus <konker@gmail.com>


" Vundle {{{
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
Bundle 'nanotech/jellybeans.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'sjl/gundo.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'

" languages
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'


" plugin configs
" ----------------------------------------------------------------------------
" Powerline
let g:Powerline_symbols = 'fancy'

" TagBar
let g:tagbar_ctags_bin = '/usr/bin/ctags'
noremap <F8> :TagbarToggle<CR>
nnoremap <Leader>t  :TagbarToggle<CR>

" IndentGuides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" NERDTree
nnoremap <Leader>n  :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
nnoremap <Leader>c  :SyntasticCheck<CR>

" Gundo
nnoremap <Leader>u  :GundoToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on
" }}}


" Text format {{{
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
" }}}


" Encoding {{{
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
" }}}


" Colour and UI {{{
" ============================================================================
syntax enable
set background=dark

try
    colorscheme jellybeans
catch /./
    " ignore
endtry

set t_Co=256
set ruler
set cursorline
set nonumber
set laststatus=2
if exists('+colorcolumn')
    set colorcolumn=80
endif

set showmatch  " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" no noise or blinking
set noerrorbells visualbell t_vb=
set listchars=tab:→\ ,trail:·,extends:»,precedes:« " Unprintable chars mapping
set list
noremap <F7> :set list!<CR>
nnoremap <Leader>s  :set list!<CR>


" highlight listchars
highlight NonText ctermfg=white guifg=white
highlight SpecialKey ctermfg=white guifg=white

" gui options
set guioptions-=T
if has("gui_gtk2")
    set guifont=Inconsolata-dz\ for\ Powerline:h13
elseif has("gui_macvim")
     set guifont=Inconsolata-dz\ for\ Powerline:h14
elseif has("gui_win32")
    set guifont=Inconsolata-dz\ for\ Powerline:h12
end
" }}}


" Backups {{{
" ============================================================================
set nowritebackup
set nobackup
set directory=/tmp//,$HOME/.tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set hidden
" }}}


" Behaviour {{{
" ============================================================================
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
if $TMUX == ''
  set clipboard+=unnamed " Yanks go on clipboard instead.
endif
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)

set foldenable " Turn on folding
set foldmethod=syntax
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

" In normal mode, press Space to toggle the current fold open/closed. However, if the cursor is not in a fold, move to the right (the default behavior)
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" }}}


" Search {{{
" ============================================================================
set ignorecase " Case insensitive search
set smartcase " Non-case sensitive search when there is a capital letter
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache
" }}}


" Tags {{{
" ============================================================================
" gentags shell script called before starting vim
" see http://github.com/konker/rcfiles
if has("autocmd")
    autocmd VimEnter * call system("~/bin/gentags")
endif

" switch on tags and specify tags file.
" ; at the end means the search will traverse up the directory tree
set tags=.tags;/
" }}}


" Shortcuts {{{
" ============================================================================
noremap <Leader>p  :set paste!<CR>
" }}}


" Autocmd {{{
" ============================================================================
if has("autocmd")

    " force formatoptions
    autocmd BufRead,BufNewFile * set formatoptions-=c
    autocmd BufRead,BufNewFile * set formatoptions-=o
    autocmd BufRead,BufNewFile * set formatoptions-=r
    autocmd BufRead,BufNewFile * set formatoptions-=t

    " ruby standard 2 spaces, always
    autocmd BufRead,BufNewFile *.rb,*.rhtml,*.feature set shiftwidth=2
    autocmd BufRead,BufNewFile *.rb,*.rhtml,*.feature set softtabstop=2

    " js 4 spaces
    autocmd BufRead,BufNewFile *.js set shiftwidth=4
    autocmd BufRead,BufNewFile *.js set softtabstop=4

    " python fold on indent
    autocmd BufRead,BufNewFile *.py set foldmethod=indent

    " coffeescript 2 spaces and fold on indent
    autocmd BufRead,BufNewFile *.coffee,*.rhtml,*.feature set shiftwidth=2
    autocmd BufRead,BufNewFile *.coffee,*.rhtml,*.feature set softtabstop=2
    au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

    " android
    autocmd BufEnter * if filereadable("AndroidManifest.xml") | set makeprg=ant\ debug | endif
    autocmd BufEnter * if expand("%:p:h") =~ '/jni' | set makeprg=ndk-build | endif

endif " has("autocmd")
" }}}


