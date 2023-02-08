-- Plugins from my old vimrc
return {
  {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme base16-gruvbox-dark-hard]])
    end
  },
  {"airblade/vim-gitgutter"},
  {"editorconfig/editorconfig-vim"},
  {"morhetz/gruvbox"},
  {"sheerun/vim-polyglot"},
  {"tpope/vim-commentary"},
  {
    "tpope/vim-fugitive",
    keys = {
      {"<leader>gs", "<cmd>Gstatus<cr>", desc="Git status"},
      {"<leader>gb", "<cmd>Gblame<cr>", desc="Git blame"},
    }
  },
  {"tpope/vim-repeat"},
  {"tpope/vim-surround"},
  {"tpope/vim-unimpaired"},
  {"tpope/vim-vinegar"},
}
