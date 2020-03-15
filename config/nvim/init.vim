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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'prettier/vim-prettier'
Plug 'previm/previm'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'

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
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nmap <silent> cgd <Plug>(coc-definition)
nmap <silent> cgy <Plug>(coc-type-definition)
nmap <silent> cgi <Plug>(coc-implementation)
nmap <silent> cgr <Plug>(coc-references)

" Show window with documentation when hovering and pressing K
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


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

let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier']

let g:previm_open_cmd = 'open -a Safari'

augroup goyo
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'typescriptreact': [],
\   'graphql': [],
\}

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

nmap <leader>rn <Plug>(coc-rename)

" prettier autosave
let g:prettier#exec_cmd_async = 1

" TODO: Automatically sort quickfix instead of piping to sort for :grep
" TODO: Figure out filesearch
" TODO: Look into gv.vim
" TODO: Look into michaeljsmith/vim-indent-obj
" TODO: gen_tags.vim and gtags
" TODO: Syntax highlighting for pipfiles.
" TODO: goyo + limelight + vim-markdown (to replace ulysses)
