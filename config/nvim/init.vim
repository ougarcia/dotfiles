" Automatic installation of vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" Install plugins
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

call plug#end()

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

" Eliminate delays on ESC
"   This delay exists because many keys (arrows keys, ALT) rely on it as an
"   escape character.
set ttimeoutlen=5

set splitbelow
set splitright

set mouse=a

" map space to leader
let g:mapleader = ' '

" Should be default
nnoremap Y y$

nnoremap <Leader>l :noh<CR>
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

let g:NERDTreeIgnore = ['\.pyc$']

" Ensure fugitive works, avoid loading EditorConfig for any remote files over
" ssh.
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*', '\.git.*']

if executable('rg')
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
" TODO: Remove vim airline
" TODO: Switch to vim-commentary
" TODO: Use wildmenu
" TODO: Use augroup
" TODO: Improve copy-paste experience.
" TODO: Switch to gruvbox
" TODO: Automatically sort quickfix instead of piping to sort for :grep
" TODO: Reconsider tabstop

" Tip: Use `:b substr_of_filename` to quickly open previously opened file. Works
"      well with wildmenu
