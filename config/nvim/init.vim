" Automatic installation of vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent !curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Install plugins
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

call plug#end()

" Colorscheme
set termguicolors
set background=dark
colorscheme gruvbox

" Two spaces
set softtabstop=2
set shiftwidth=2
set expandtab

" Show the 80 char rule
set textwidth=80
set colorcolumn=+1

" Use case insensitive search except when using capital letters
set ignorecase
set smartcase

set splitbelow
set splitright

set wildignore+=*.pyc

" Use to be a nvim default, but was removed until mouse=a is improved
set mouse=a

" No backup
set nobackup
set nowritebackup
set noswapfile

" map space to leader
let g:mapleader = ' '

nnoremap <Leader>tt :tabedit<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>


" Ensure fugitive works, avoid loading EditorConfig for any remote files over
" ssh. Don't use EditorConfig for commit messages
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*', '\.git.*']
