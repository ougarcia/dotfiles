return {
  'loctvl842/monokai-pro.nvim',
  lazy = false, -- load  during startup if main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd.colorscheme('monokai-pro')
  end,
}
