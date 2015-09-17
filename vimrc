set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'jszakmeister/vim-togglecursor'


" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" colorscheme
set background=dark
colorscheme base16-default
" use soft tabs (2 spaces)
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" because git
set nobackup
set nowritebackup
set noswapfile
" set relative numberlines but show the line number of the one i'm on
set relativenumber
set number
" show the 80 char rule
set colorcolumn=81
set textwidth=80
" Use case insensitive search except when using capital letters, search incrementally
set ignorecase
set smartcase
set incsearch
" cursor position, incomplete commands, two line status bar
set ruler
set showcmd
set laststatus=2
" Exit insert mode instantaneously at the cost of no escape sequences
"set noesckeys
set ttimeoutlen=5

"map space to leader
let mapleader = " "
"map frequent actions to leader
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>X :xa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <leader><leader> <c-^>
nnoremap <Leader>g :vertical resize 85<CR>
nnoremap <Leader>G :vertical resize 88<CR>
nnoremap <Leader>r :redraw!<CR>
nnoremap <Leader>R :source ~/.vimrc<CR>
nnoremap <Leader>C :SyntasticCheck eslint<CR>

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

" insert lines without entering insert mode
nmap <CR> O<Esc>j

" pick linter for js
let g:syntastic_javascript_checkers = ['jshint']
"run linter on opening file
let g:syntastic_check_on_open = 1


"annoying errors in erb
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
let g:airline_powerline_fonts = 1
