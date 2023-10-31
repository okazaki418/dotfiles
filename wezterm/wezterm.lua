-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font("Firple")
config.font_size = 14.0

-- For example, changing the color scheme:
wezterm.color.load_scheme("~/.config/wezterm/tokyonight_night.toml")
config.color_scheme = "Tokyo Night"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
config.text_background_opacity = 0.95

-- and finally, return the configuration to wezterm
return config
