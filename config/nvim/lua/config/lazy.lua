local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
-- TODO: port these to LUA
vim.cmd([[
set termguicolors
" colorscheme gruvbox

set textwidth=80
set colorcolumn=+1

set ignorecase
set smartcase

set splitbelow
set splitright

set wildignore+=*.pyc

set noswapfile

nnoremap <Leader>tt :tabedit<CR>

" Ensure fugitive works, avoid loading EditorConfig for any remote files over
" ssh. Don't use EditorConfig for commit messages
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*', '\.git.*']
]])
