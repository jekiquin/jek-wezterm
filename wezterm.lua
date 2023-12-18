local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local config = {}

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window()
	window:maximize()
end)

config.default_cwd = "D:/JerickDocuments/WebDevelopment"
config.default_prog = { "powershell.exe" }
config.exit_behavior = "Close"

config.color_scheme = "Hardcore"

config.font = wezterm.font("MesloLGL Nerd Font")
config.font_size = 10.0

config.use_dead_keys = false
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}

config.enable_scroll_bar = false
config.background = {
	{
		source = {
			File = "./background/pxfuel.png",
		},
		repeat_x = "NoRepeat",
		vertical_align = "Middle",
		horizontal_align = "Center",
		hsb = {
			brightness = 0.05,
		},
	},
}

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{ key = "+", mods = "CTRL|SHIFT", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL|SHIFT", action = act.DecreaseFontSize },
	{ key = "0", mods = "CTRL|SHIFT", action = act.ResetFontSize },
	{ key = "d", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "f", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
}

return config
