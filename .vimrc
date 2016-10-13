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
"Bundle 'nanotech/jellybeans.vim'
Bundle 'morhetz/gruvbox'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'sjl/gundo.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'ciaranm/detectindent'
Bundle 'Shougo/vimshell.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/bufkill.vim'
"Bundle 'kshenoy/vim-signature'
"Bundle 'Shougo/unite.vim'
"Bundle 'Shougo/vimproc.vim'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'scrooloose/nerdtree'
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'Lokaltog/vim-powerline'

" languages
Bundle 'tpope/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'derekwyatt/vim-scala'
"Bundle 'kovisoft/slimv'
Bundle 'vim-coffee-script'
Bundle 'hail2u/vim-css3-syntax'
"Bundle 'leafgarland/typescript-vim'
"Bundle 'tfnico/vim-gradle'
"Bundle 'scrooloose/syntastic'
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-haml'
"Bundle 'klen/python-mode'
"Bundle 'chrisbra/csv.vim'


" Plugin configs {{{
" ----------------------------------------------------------------------------
" Airline
let g:airline_powerline_fonts = 1

" Powerline
let g:Powerline_symbols = 'fancy'

" TagBar
let g:tagbar_ctags_bin = '/usr/bin/ctags'
noremap <F8> :TagbarToggle<CR>
nnoremap <Leader>t  :TagbarToggle<CR>

" IndentGuides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" IndentLines
let g:indentLine_char = '│'
let g:indentLine_color_term = 239

" DetectIndent
" To prefer 'expandtab' to 'noexpandtab' when no detection is possible:
:let g:detectindent_preferred_expandtab = 1

" To specify a preferred indent level when no detection is possible:
:let g:detectindent_preferred_indent = 4


" NERDTree
"nnoremap <Leader>n  :NERDTreeToggle<CR>

" Syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_mode_map = { 'mode': 'passive',
                           "\ 'active_filetypes': [],
                           "\ 'passive_filetypes': [] }
"nnoremap <Leader>c  :SyntasticCheck<CR>

" Gundo
nnoremap <Leader>u  :GundoToggle<CR>

" VimShell
let g:vimshell_right_prompt='getcwd()'
nnoremap <leader>c :VimShell -split<CR>
nnoremap <leader>cc :VimShell -split<CR>
nnoremap <leader>cn :VimShellInteractive node<CR>
nnoremap <leader>cl :VimShellInteractive lua<CR>
nnoremap <leader>cr :VimShellInteractive irb<CR>
nnoremap <leader>cp :VimShellInteractive python<CR>

" Unite
"let g:unite_data_directory='~/.vim/unite//'
"nnoremap <C-p> :Unite file_rec/async<CR>
"nnoremap <space>/ :Unite grep:.<CR>
"nnoremap <space>s :Unite -quick-match buffer<CR>

" Slimv
let g:slimv_impl = 'mit'
let g:scheme_builtin_swank = 1
let g:slimv_repl_split = 4
""let g:slimv_swank_cmd = '! xterm -e sbcl --load /usr/share/common-lisp/source/slime/start-swank.lisp &'
""let g:slimv_swank_clojure = '! xterm -e lein swank &'
""let g:slimv_swank_cmd = '! xterm -e mit-scheme-x86-64 --eval "(let loop () (start-swank) (loop))" &'

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
set conceallevel=0

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
    "colorscheme jellybeans
    colorscheme gruvbox
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

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=Brown

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


" Undo persistence {{{
" ============================================================================
if exists("+undofile")
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=~/.vim/undo//
    set undofile
endif
" }}}


" Behaviour {{{
" ============================================================================
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.

if $TMUX == ''
  set clipboard+=unnamedplus " Yanks go on clipboard instead.
endif

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)

set foldenable " Turn on folding
set foldmethod=marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

" In normal mode, press Space to toggle the current fold open/closed. However, if the cursor is not in a fold, move to the right (the default behavior)
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" }}}

" Auto center {{{
" ============================================================================
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz
"}}}


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


" Shortcuts and keymappings {{{
" ============================================================================
nnoremap <Leader>p  :set paste!<CR>

" call make and toggle quickfix window
nnoremap <F9> :make!<CR>

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>

" remap arrow keys
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up> :cnext<CR>
nnoremap <down> :cprev<CR>

" allow cursor movement in insert mode
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
" }}}


" Autocmd {{{
" ============================================================================
if has("autocmd")
    " don't highlight trailing whitespace in insert mode
    autocmd ColorScheme * highlight ExtraWhitespace guibg=red
    autocmd BufEnter * match ExtraWhitespace /\S\zs\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/

    " force formatoptions
    autocmd BufRead,BufNewFile * set formatoptions-=c
    autocmd BufRead,BufNewFile * set formatoptions-=o
    autocmd BufRead,BufNewFile * set formatoptions-=r
    autocmd BufRead,BufNewFile * set formatoptions-=t

    " Don't flipping hide quotes for JSON/etc
    autocmd BufEnter * set conceallevel=0

    " Automatically open, but do not go to (if there are errors) the quickfix /
    " location list window, or close it when is has become empty.
    "
    " Note: Must allow nesting of autocmds to enable any customizations for quickfix
    " buffers.
    " Note: Normally, :cwindow jumps to the quickfix window if the command opens it
    " (but not if it's already open). However, as part of the autocmd, this doesn't
    " seem to happen.
    autocmd QuickFixCmdPost [^l]* nested botright cwindow
    autocmd QuickFixCmdPost    l* nested lwindow

    " ruby standard 2 spaces, always
    autocmd BufRead,BufNewFile *.rb,*.rhtml,*.feature set shiftwidth=2
    autocmd BufRead,BufNewFile *.rb,*.rhtml,*.feature set softtabstop=2

    " js 4 spaces
    autocmd BufRead,BufNewFile *.js set shiftwidth=4
    autocmd BufRead,BufNewFile *.js set softtabstop=4
    autocmd BufEnter *.js set makeprg=npm-do\ eslint\ -f\ unix\ %

    " python fold on indent
    autocmd BufRead,BufNewFile *.py set foldmethod=indent

    " coffeescript 2 spaces and fold on indent
    autocmd BufRead,BufNewFile *.coffee,*.rhtml,*.feature set shiftwidth=2
    autocmd BufRead,BufNewFile *.coffee,*.rhtml,*.feature set softtabstop=2
    autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent

    " disable paste when leaving insert mode
    autocmd InsertLeave * set nopaste

    " detect indent style
    :autocmd BufReadPost * :DetectIndent

    " java
    autocmd BufNewFile,BufReadPost *.java set makeprg=mvn\ package\ -q
    autocmd BufNewFile,BufReadPost *.java set errorformat=[ERROR]\ %f:[%l%.%c]%m

    " android
    autocmd BufEnter * if filereadable("AndroidManifest.xml") | set makeprg=ant\ debug | endif
    autocmd BufEnter * if expand("%:p:h") =~ '/jni' | set makeprg=ndk-build | endif

endif " has("autocmd")
" }}}


