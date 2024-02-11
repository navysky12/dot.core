-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- config.default_prog = {'/bin/zsh'} -- To prevent zsh launching as login shell
config.font = wezterm.font 'JetBrains Mono'
local filePath = os.getenv("XDG_CACHE_HOME") .. "/wal/colors-wezterm.yml"
if io.open(filePath) then
  local colors, _ = wezterm.color.load_base16_scheme(filePath)
  config.colors = colors
end
config.window_background_opacity = 0.90
config.enable_tab_bar = false
config.enable_scroll_bar = true

-- and finally, return the configuration to wezterm
return config

