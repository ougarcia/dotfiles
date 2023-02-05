" Automatic installation of vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  augroup plugin_install
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvin/init.vim
  augroup END
endif

" Use the vim-go plugin instead
let g:polyglot_disabled = ['go']

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

" TODO: Learn to use folds and reenable this
let g:vim_markdown_folding_disabled = 1

" map space to leader
let g:mapleader = ' '

" Should be default
nnoremap Y y$

nnoremap <Leader>l :noh<CR>
nnoremap <Leader>g :vertical resize 101<CR>
nnoremap <Leader>G :vertical resize 105<CR>
nnoremap <Leader>tt :tabedit<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" Ensure fugitive works, avoid loading EditorConfig for any remote files over
" ssh. Don't use EditorConfig for commit messages
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*', '\.git.*']
