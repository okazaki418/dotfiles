-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action


-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font_with_fallback({
  {
    family = 'Moralerspace Neon HWNF',
    harfbuzz_features = { 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },

  },
  'Firple',
  'HackGenNerd Console',
  'Font Awesom 6 Free',
  'Noto Color Emoji',
})
config.font_size = 14.0

config.keys = {
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
}

-- wezterm.color.load_scheme("/home/okazaki/.config/wezterm/tokyonight_night.toml")
-- config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Neon"
-- config.color_scheme = 'Neon (terminal.sexy)'
-- config.color_scheme = 'Neon Night (Gogh)'
-- config.colors = {
--   background = "#1e1e1e"
-- }
config.color_scheme = "Apple System Colors"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
config.text_background_opacity = 0.95
-- config.enable_wayland = false

-- and finally, return the configuration to wezterm
return config
