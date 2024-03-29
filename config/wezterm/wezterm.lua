local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Monokai Pro (Gogh)'
config.enable_tab_bar = false
config.font = wezterm.font 'Berkeley Mono'
config.font_size = 14.0
config.line_height = 1.2
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
