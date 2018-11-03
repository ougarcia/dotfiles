" Automatic installation of vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  augroup plugin_install
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
  augroup END
endif

" Install plugins
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'

Plug '/usr/local/opt/fzf'

call plug#end()

" Colorscheme
set termguicolors
set background=dark
" let g:gruvbox_contrast_dark = "light"
" let g:gruvbox_contrast_dark = "dark"
colorscheme gruvbox
let g:solarized_term_italics = 1
let g:solarized_extra_hi_groups = 1

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

" TODO: Learn to use folds and reenable this
let g:vim_markdown_folding_disabled = 1

" map space to leader
let g:mapleader = ' '

" Should be default
nnoremap Y y$

nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>l :noh<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>g :vertical resize 101<CR>
nnoremap <Leader>G :vertical resize 105<CR>
nnoremap <Leader>rd :redraw!<CR>
nnoremap <Leader>rc :source ~/.config/nvim/init.vim<CR>
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

" Ensure fugitive works, avoid loading EditorConfig for any remote files over
" ssh. Don't use EditorConfig for commit messages
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
  " output. The hacky part is figuring out how to use a pipe when setting
  " grepprg.  The pipe is escaped as `\\\|`. An escaped backslash and an
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


augroup goyo
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" TODO: Automatically sort quickfix instead of piping to sort for :grep
" TODO: Figure out filesearch
" TODO: Look into gv.vim
" TODO: Look into michaeljsmith/vim-indent-obj
" TODO: gen_tags.vim and gtags
" TODO: Syntax highlighting for pipfiles.
" TODO: goyo + limelight + vim-markdown (to replace ulysses)
