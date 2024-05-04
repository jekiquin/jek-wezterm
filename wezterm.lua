local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local config = {}

wezterm.on("gui-attached", function(domain)
	-- maximize all displayed windows on startup
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

config.default_cwd = "D:/JerickDocuments/WebDevelopment"
config.default_prog = { "powershell.exe" }
config.exit_behavior = "Close"

config.color_scheme = "Hardcore"

config.font = wezterm.font_with_fallback({
	{
		family = "Fira Code",
		harfbuzz_features = { "cv01", "cv02", "cv04", "cv08", "ss05", "ss04", "cv18", "ss03", "cv16" },
	},
	"MesloLGL Nerd Font",
})
config.font_size = 11.0



config.use_dead_keys = false
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false
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
			File = wezterm.config_dir .. "/background/background.png",
		},
		repeat_x = "NoRepeat",
		vertical_align = "Middle",
		horizontal_align = "Center",
		hsb = {
			brightness = 0.02,
		},
	},
}

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "-", mods = "CTRL|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "=", mods = "CTRL|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "q", mods = "CTRL|ALT", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "h", mods = "CTRL|ALT", action = act.AdjustPaneSize {"Left",5} },
	{ key = "l", mods = "CTRL|ALT", action = act.AdjustPaneSize {"Right",5} },
	{ key = "j", mods = "CTRL|ALT", action = act.AdjustPaneSize {"Down",5} },
	{ key = "k", mods = "CTRL|ALT", action = act.AdjustPaneSize {"Up",5} },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "p", mods = "LEADER", action = act.ActivateCommandPalette },

	-- workspaces
	{
		key = "0",
		mods = "LEADER",
		action = act.SwitchToWorkspace({ name = "default" }),
	},
	{
		key = "9",
		mods = "LEADER",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	{
		key = "w",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
}

return config
