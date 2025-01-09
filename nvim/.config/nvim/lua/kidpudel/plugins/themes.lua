return {
	-- if this theme is works for you, no need to second guessing the color scheme and waste time on this bs.
	-- It’s a good to always be evolving, always willing to let go of the comfortable old way to discover a better new way.
	-- It's all a matter of taste and how you get used to it.
	-- Choose one theme and stick with it, because it is a waste of time. Instead of building something cool and becoming greater, you waste your time, just pick what exists.
	--
	-- this theme works for me, but i want to find something new for me, to not stuck
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			contrast = "hard",
	-- 		})
	-- 		-- test from default
	-- 		-- vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				keywordStyle = { italic = false },
				overrides = function(colors)
					local palette = colors.palette
					return {
						String = { italic = true },
						Boolean = { fg = palette.dragonPink },
						Constant = { fg = palette.dragonPink },

						Identifier = { fg = palette.dragonBlue },
						Statement = { fg = palette.dragonBlue }, -- logic, focus
						Operator = { fg = palette.dragonGray2 },
						Keyword = { fg = palette.dragonRed }, -- strength of builtin keywords (core)
						-- Function = { fg = palette.dragonGreen }, -- v1. i like green functions
						Function = { fg = palette.dragonOrange }, -- v2. action

						-- Type = { fg = palette.dragonYellow }, -- v1. creativity of custom types
						Type = { fg = palette.dragonGreen }, -- v2. Newness

						-- Special = { fg = palette.dragonOrange }, -- v1. which emphesises the maturity over the new types
						Special = { fg = palette.dragonYellow }, -- v2. cheers, that this type is builtin

						["@lsp.typemod.function.readonly"] = { fg = palette.dragonBlue },
						["@variable.member"] = { fg = palette.dragonBlue },
					}
				end,
			})
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
	{
		"aktersnurra/no-clown-fiesta.nvim",
		config = function()
			local palette = require("no-clown-fiesta.palette")
			require("no-clown-fiesta").setup({
				-- transparent = true,
				styles = {
					comments = { italic = true },
					match_paren = { underline = false, bg = palette.gray },
					PmenuSel = { bg = palette.yellow },
				},
			})
		end,
	},
}
