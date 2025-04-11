-- UI
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    routes = {
      {
        view = 'notify',
        filter = { event = 'msg_showmode' },
      },
    },
    views = {
      cmdline_popup = {
        border = {
          style = 'none',
          padding = { 2, 3 },
        },
        filter_options = {},
        win_options = {
          winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
        },
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
