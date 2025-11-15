local wezterm = require("wezterm")
local act = wezterm.action



local config = {
	-- color_scheme = "GruvboxDarkHard",
	font = wezterm.font("Roboto Mono", { weight = "Bold" }),
	font_size = 16.0,

	window_decorations = "RESIZE",
	--  window_frame = {
	--         inactive_titlebar_bg = "none",
	--         active_titlebar_bg = "none",
	-- }
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },

	keys = {
		{
			key = "f",
			mods = "CMD|CTRL",
			action = wezterm.action.ToggleFullScreen,
		},

		-- Keybindings with SUPER+CTRL
		{ key = 'h', mods = 'SUPER|CTRL', action = act.ActivatePaneDirection('Left') },
		{ key = 'j', mods = 'SUPER|CTRL', action = act.ActivatePaneDirection('Down') },
		{ key = 'k', mods = 'SUPER|CTRL', action = act.ActivatePaneDirection('Up') },
		{ key = 'l', mods = 'SUPER|CTRL', action = act.ActivatePaneDirection('Right') },

		-- Keybindings with Ctrl+a (Leader)
		-- Note: The 'LEADER' modifier is implicitly applied to keys defined in the `config.keys` table 
		-- when the `leader` key is pressed first.
		{ key = 'h', mods = 'LEADER', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) }, -- new_split:left (vertical split moves new pane to the left/right)
		{ key = 'j', mods = 'LEADER', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) }, -- new_split:down (horizontal split moves new pane to top/bottom)
		{ key = 'k', mods = 'LEADER', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) }, -- new_split:up
		{ key = 'l', mods = 'LEADER', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) }, -- new_split:right
		{ key = 'f', mods = 'LEADER', action = act.TogglePaneZoomState }, -- toggle_split_zoom
		{ key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) }, -- next_tab
		{ key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) }, -- previous_tab

		-- Keybinding with SUPER+r
		{ key = 'r', mods = 'SUPER', action = act.ReloadConfiguration }, -- reload_config
	},

	macos_window_background_blur = 30,

	cursor_blink_rate = 0,
	-- enable_tab_bar = false, i need it now 🤷

	-- color theme
	color_scheme = "Catppuccin Mocha"

}

return config
