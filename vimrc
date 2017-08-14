set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" Colorscheme
set background=dark
colorscheme base16-default-dark

" Use two spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" But Makefiles require tabs
autocmd FileType make setlocal noexpandtab

" Don't need these because git
set nobackup
set nowritebackup
set noswapfile

" Numbers
set relativenumber
set number


" Show the 80 char rule
set textwidth=80
set colorcolumn=+1

" Use case insensitive search except when using capital letters, search
" incrementally
set ignorecase
set smartcase
set incsearch

" Cursor position, incomplete commands, two line status bar
set ruler
set showcmd
set laststatus=2

" Eliminate delays on ESC
"   This delay exists because many keys (arrows keys, ALT) rely on it as an
"   escape character.
set ttimeoutlen=5

set splitbelow
set splitright

set list listchars=tab:··,trail:·,nbsp:·

set mouse=a

" map space to leader
let mapleader = " "

" Should be default
nnoremap Y y$

nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>g :vertical resize 101<CR>
nnoremap <Leader>G :vertical resize 105<CR>
nnoremap <Leader>rd :redraw!<CR>
nnoremap <Leader>rc :source ~/.vimrc<CR>
nnoremap <Leader>tt :tabedit<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gdiff<CR>
nnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>dp :diffput<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

map <C-n> :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

nnoremap <Leader>lp :SyntasticCheck prospector<CR>

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_python_checkers = ['pep8']

" Temporary configs: Enabled when working on a repo small enough that these
" options don't take forever.

" let g:syntastic_check_on_open = 1
" let g:syntastic_python_checkers = ['prospector']

let NERDTreeIgnore = ['\.pyc$']

let g:syntastic_error_symbol = ">"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = ">"
let g:syntastic_style_warning_symbol = ">"

" Ensure fugitive works, avoid loading EditorConfig for any remote files over
" ssh.
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

if executable("rg")
  " rg uses multiple threads to search. This has two notable consequences
  "   1. The search is fast.
  "   2. The result order is nondeterministic.
  "
  " rg has the option to return sorted results, but that runs the search in a
  " single thread and is too slow.
  "
  " This is a dirty hack that lets me search in parallel and then sort the
  " output. The hacky part is figuring out how to use a pip when setting the
  " grep program.  The pipe is escaped as `\\\|` an escaped backslash and an
  " escaped pipe produce `\|`, which undergoes one more round of processing to
  " end up with `|`.
  "
  " Since the sort is O(nlog(n)) on the number of results, the
  " added time is negligible on specific search and is not that bad on general
  " ones.

  set grepprg=rg\ --vimgrep\ $*\\\|sort
  set grepformat^=%f:%l:%c:%m

  " Nicer than built-in :grep.
  command! -nargs=+ Gr execute "silent grep <args>" | copen

  " Smart-case and literal string.
  command! -nargs=+ Ga execute "Gr -SF <args>"

  " Only look in tests.
  command! -nargs=+ Gt execute "Ga -g '*tests*' <args>"

  " Don't look in tests.
  command! -nargs=+ G execute "Ga -g '!*tests*' <args>"
endif

" TODO: Use neovim.
" TODO: Use neomake or ALE.
" TODO: Use a maintained plugin manager.
" TODO: Replace ctrlp with something newer/faster. Probably using tags somehow.
" TODO: Use local vimrc for projects with weird conventions. (or editorconfig)
" TODO: Remove vim airline
" TODO: Switch to vim-commentary
" TODO: Use wildmenu
" TODO: Use augroup
" TODO: Improve copy-paste experience.
" TODO: Switch to gruvbox
" TODO: Automatically sort quickfix instead of piping to sort for :grep

" Tip: Use `:b substr_of_filename` to quickly open previously opened file. Works
"      well with wildmenu
