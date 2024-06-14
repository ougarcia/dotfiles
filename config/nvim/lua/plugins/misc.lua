return {
  'nvim-tree/nvim-web-devicons',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- git  signs in gutter, also utilities for managing changes
  { 'lewis6991/gitsigns.nvim', opts = {} },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
