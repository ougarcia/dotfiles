return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local logo = [[
      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗      
      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      
      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      
      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      
      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║      
      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝      
    ]]

    -- Add top and bottom padding to log
    logo = string.rep('\n', 8) .. logo .. '\n\n'

    local opts = {
      theme = 'doom',
      config = {
        header = vim.split(logo, '\n'),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files", desc = " Find File",    icon = " ", key = "f" },
          { action = "ene | startinsert",    desc = " New File",     icon = " ", key = "n" },
          { action = "Telescope oldfiles",   desc = " Recent Files", icon = " ", key = "r" },
          { action = "Telescope live_grep",  desc = " Find Text",    icon = " ", key = "g" },
          { action = "qa",                   desc = " Quit",         icon = " ", key = "q" },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            '⚡ Neovim loaded '
              .. stats.loaded
              .. '/'
              .. stats.count
              .. ' plugins in '
              .. ms
              .. 'ms',
          }
        end,
      },
    }

    -- Add leading whitespace to button description so it's wider and looks
    -- better.
    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    require('dashboard').setup(opts)
  end,
}
