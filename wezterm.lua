local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

config.default_cwd = "D:/JerickDocuments/WebDevelopment"
config.default_prog = { "powershell.exe" }
config.exit_behavior = "Close"

config.color_scheme = "Hardcore"

config.font = wezterm.font("MesloLGL Nerd Font")
config.font_size = 10.0

config.use_dead_keys = false
config.scrollback_lines = 5000

config.hide_tab_bar_if_only_one_tab = true

config.enable_scroll_bar = true
config.min_scroll_bar_height = "2cell"
config.colors = {
	scrollbar_thumb = "white",
}

config.background = {
	{
		source = {
			File = "./background/pxfuel.png",
		},
		repeat_x = "NoRepeat",
		vertical_align = "Middle",
		horizontal_align = "Center",
		hsb = {
			brightness = 0.1,
		},
	},
}

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{ key = "+", mods = "LEADER", action = act.IncreaseFontSize },
	{ key = "-", mods = "LEADER", action = act.DecreaseFontSize },
	{ key = "0", mods = "LEADER", action = act.ResetFontSize },
	{ key = "f", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "LEADER", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
}
return config
