local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "rose-pine-dawn"
config.font_size = 11.5
config.hide_tab_bar_if_only_one_tab = true

config.default_cwd = wezterm.home_dir .. "/dev/iac"
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
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
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
	-- Resize panes
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
	-- Launch programs
	{
		key = "F3",
		action = wezterm.action.SpawnCommandInNewWindow({
			args = { "distrobox", "enter", "env", "--", "nvim index.md && git pull" },
			cwd = wezterm.home_dir .. "/dev/my-data/wiki/",
		}),
	},
	{
		key = "F5",
		action = wezterm.action.SpawnCommandInNewWindow({
			args = { "distrobox", "enter", "env", "--", "nvim && git pull" },
			cwd = wezterm.home_dir .. "/dev/iac/",
		}),
	},
	{
		key = "F6",
		action = wezterm.action.SpawnCommandInNewWindow({
			args = { "distrobox", "enter", "env", "--", "btm" },
		}),
	},
	{
		key = "F7",
		action = wezterm.action.SpawnCommandInNewWindow({
			args = { "distrobox", "enter", "env", "--", "lazygit" },
		}),
	},
}

return config
