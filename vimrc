set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

set background=dark
colorscheme solarized
set tabstop=2
set softtabstop=2
set shiftwidth=2                    "set default indenting to 2 spaces
set expandtab
set noimdisable
set iminsert=0
set imsearch=0
set nobackup
set nowritebackup
set noswapfile
set relativenumber                  "set relative numberlines
set number                          "show the line number of the one i'm on
set textwidth=72
set colorcolumn=81                  "show the 80 char rule
set laststatus=2
set ignorecase                      "Use case insensitive search
set smartcase                       "except when using capital letters
set ruler                           " show the cursor position all the time
set showcmd                         " display incomplete commands
set incsearch

"map space to leader
let mapleader = " "
"map frequent actions to leader
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <leader><leader> <c-^>
nnoremap <Leader>g :vertical resize 85<CR>
nnoremap <Leader>r :source ~/.vimrc<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" copy visualy selected text to clipboard
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

"toggle nerdreee
map <C-n> :NERDTreeToggle<CR>
