local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local config = wezterm.config_builder()
config.font = wezterm.font_with_fallback({
	"Iosevka Nerd Font Mono",
	"JetBrains Nerd Font Mono",
})
config.font_size = 15
config.color_scheme = "Kanagawa (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.detect_password_input = false
smart_splits.apply_to_config(config, {
	direction_keys = {
		move = { "h", "j", "k", "l" },
		resize = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
	},
	modifiers = {
		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
		resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
	log_level = "info",
})
config.keys = {
	{ key = "W",     mods = "SHIFT|CTRL",     action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = 'H',     mods = 'SHIFT|CTRL',     action = wezterm.action.ActivatePaneDirection 'Left' },
	{ key = 'H',     mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize { 'Left', 1 } },
	{ key = 'L',     mods = 'SHIFT|CTRL',     action = wezterm.action.ActivatePaneDirection 'Right' },
	{ key = 'L',     mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize { 'Right', 1 } },
	{ key = 'K',     mods = 'SHIFT|CTRL',     action = wezterm.action.ActivatePaneDirection 'Up' },
	{ key = 'K',     mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize { 'Up', 1 } },
	{ key = 'J',     mods = 'SHIFT|CTRL',     action = wezterm.action.ActivatePaneDirection 'Down' },
	{ key = 'J',     mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize { 'Down', 1 } },
	{ key = 'Enter', mods = 'ALT',            action = wezterm.action.DisableDefaultAssignment },
}
return config
