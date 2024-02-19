local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "rose-pine-dawn"
config.hide_tab_bar_if_only_one_tab = true

config.adjust_window_size_when_changing_font_size = false
config.default_prog = { "distrobox", "enter", "env" }

config.keys = {
	-- Create panes
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "_",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({ direction = "Down", size = { Cells = 15 } }),
	},
	-- Closing panes/windows
	{
		key = "q",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	-- Moving pane focus
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	-- Work around for `Ctrl-Shift+2` bug
	{
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(1),
	},
	-- Resize panes
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
	{ key = "m", mods = "CTRL|SHIFT", action = wezterm.action.TogglePaneZoomState },
	-- Launch programs
	{
		key = "F1",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "distrobox", "enter", "env" },
			cwd = wezterm.home_dir .. "/dev/m/mono/",
		}),
	},
	{
		key = "F2",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "distrobox", "enter", "env" },
			cwd = wezterm.home_dir .. "/dev/fx-integration-api/",
		}),
	},
	{
		key = "F5",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "distrobox", "enter", "env" },
			cwd = wezterm.home_dir,
		}),
	},
	{
		key = "F6",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "distrobox", "enter", "env", "--", "nvim index.md && git pull" },
			cwd = wezterm.home_dir .. "/dev/my-data/wiki/",
		}),
	},
	{
		key = "F7",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "distrobox", "enter", "env", "--", "nvim && git pull" },
			cwd = wezterm.home_dir .. "/dev/iac/",
		}),
	},
	{
		key = "F8",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "distrobox", "enter", "env", "--", "nvim && git pull" },
			cwd = wezterm.home_dir .. "/dev/proxomox-services/",
		}),
	},
	{
		key = "F11",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "distrobox", "enter", "env", "--", "lazygit" },
		}),
	},
	{
		key = "F12",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "distrobox", "enter", "env", "--", "btm" },
		}),
	},
	{
		key = "D",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ShowDebugOverlay,
	},
}

local hostname = wezterm.hostname()

config.default_cwd = wezterm.home_dir .. "/dev/iac"

if hostname == "brian-pop-os-pc-specialist" then
	config.font_size = 11.5
	config.default_cwd = wezterm.home_dir .. "/dev/m/mono"
end

return config
