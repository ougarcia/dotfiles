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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'sheerun/vim-polyglot'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-rails'
Plugin 'ngmy/vim-rubocop'
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
colorscheme base16-default

" Use soft tabs (2 spaces)
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Use 4 spaces for html and css(not by choice)
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType scss setlocal shiftwidth=4 tabstop=4 softtabstop=4

autocmd Filetype javascript setlocal sw=4
autocmd FileType dtml setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Because git
set nobackup
set nowritebackup
set noswapfile

" Set relative numberlines but show the line number of the one i'm on (Currently
" trying out vim without numbers)
set relativenumber
set number


" Show the 100 char rule
"   -- temporarily (begrudgingly) try out 100 chars
set colorcolumn=101
set textwidth=100

" Use case insensitive search except when using capital letters, search incrementally
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

" map space to leader
let mapleader = " "

" Should be default
nnoremap Y y$

"map frequent actions to leader
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>X :xa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <leader><leader> <c-^>
nnoremap <Leader>g :vertical resize 101<CR>
nnoremap <Leader>G :vertical resize 105<CR>
nnoremap <Leader>rd :redraw!<CR>
nnoremap <Leader>rc :source ~/.vimrc<CR>
nnoremap <Leader>es :SyntasticCheck eslint<CR>
nnoremap <Leader>tt :tabedit<CR>
nnoremap <Leader>tb :TagbarToggle<CR>

" Shortcuts for Vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gdiff<CR>
nnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>dp :diffput<CR>


" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


"toggle nerdreee
map <C-n> :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

" insert lines without entering insert mode
nmap <CR> O<Esc>j

" Manually run prospector
nnoremap <Leader>lp :SyntasticCheck prospector<CR>

" specify linters
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_haml_checkers = ['haml_lint']
" Stupid warning message in rubocop. Have to take time to fix this soon.
"let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_checkers = ['mri']
"run linter on opening file
"let g:syntastic_check_on_open = 1

let g:syntastic_python_checkers = ['pep8']
"let g:syntastic_python_checkers = ['prospector']

"annoying errors in erb
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
let g:airline_powerline_fonts = 1

" Use ag in CtrlP for listing files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Display extra whitespace
set list listchars=tab:··,trail:·,nbsp:·

set mouse=a

let NERDTreeIgnore = ['\.pyc$']

let g:syntastic_error_symbol = ">"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = ">"
let g:syntastic_style_warning_symbol = ">"
