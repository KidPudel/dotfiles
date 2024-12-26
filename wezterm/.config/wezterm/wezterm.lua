local wezterm = require("wezterm")

return {
	-- color_scheme = "GruvboxDarkHard",
	font = wezterm.font("Roboto Mono", { weight = "Bold" }),
	font_size = 13.0,

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

	keys = {
		{
			key = "f",
			mods = "CMD|CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},

	macos_window_background_blur = 30,

	cursor_blink_rate = 0,
	enable_tab_bar = false,

	-- color theme
	colors = {
		-- Main UI Colors
		foreground = "#ebdbb2", -- Text color
		background = "#1d2021", -- Background color

		-- Cursor Colors
		cursor_bg = "#bdae93", -- Cursor color
		cursor_border = "#bdae93", -- Cursor border color
		cursor_fg = "#665c54", -- Text color on the cursor

		-- Selection Colors
		selection_bg = "#d65d0e", -- Selection background color
		selection_fg = "#ebdbb2", -- Selection text color

		-- ANSI Color Codes
		ansi = {
			"#3c3836", -- color0: Black
			"#cc241d", -- color1: Red
			"#98971a", -- color2: Green
			"#d79921", -- color3: Yellow
			"#458588", -- color4: Blue
			"#b16286", -- color5: Magenta
			"#689d6a", -- color6: Cyan
			"#a89984", -- color7: White (light gray)
		},
		brights = {
			"#928374", -- color8: Bright Black (dark gray)
			"#fb4934", -- color9: Bright Red
			"#b8bb26", -- color10: Bright Green
			"#fabd2f", -- color11: Bright Yellow
			"#83a598", -- color12: Bright Blue
			"#d3869b", -- color13: Bright Magenta
			"#8ec07c", -- color14: Bright Cyan
			"#fbf1c7", -- color15: Bright White
		},

		-- URL Color
		-- hyperlink_rules = {
		-- 	{ regex = "\\b\\w+://[\\w.-]+\\S*", format = "$0", color = "#458588" }, -- Matches URLs and gives them the desired color
		-- },

		-- Tab Bar Colors (Optional, add if you want custom colors for tabs)
		tab_bar = {
			background = "#1d2021", -- Background color of the tab bar

			active_tab = {
				bg_color = "#689d6a", -- Active tab background
				fg_color = "#ebdbb2", -- Active tab text
			},

			inactive_tab = {
				bg_color = "#3c3836", -- Inactive tab background
				fg_color = "#a89984", -- Inactive tab text
			},

			new_tab = {
				bg_color = "#3c3836", -- New tab background
				fg_color = "#a89984", -- New tab text
			},
		},
	},
}
