return {
  'echasnovski/mini.files',
  config = function()
    require('mini.files').setup()
    vim.keymap.set('n', '-', function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
      MiniFiles.reveal_cwd()
    end, { desc = 'Open parent directory' })
  end,
}
