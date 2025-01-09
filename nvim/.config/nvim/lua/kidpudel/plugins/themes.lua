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
	-- subtle, and not distracting dark theme, less vibrant than gruvbox
	-- very beautiful, but in practice, not comprehending with it as well as i do in gruvbox
	-- it IS simply doesnt work for me, colors are not organized the way for me to quickly parse it, i quicker parse the plain white text
	-- but i can make it better, by customizing it!
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
						Statement = { fg = palette.dragonBlue },
						-- Operator = { fg = palette.dragonBlue2 },
						Operator = { fg = palette.dragonGray2 },
						Keyword = { fg = palette.dragonRed },
						-- names
						Function = { fg = palette.dragonGreen },

						Type = { fg = palette.dragonYellow },

						Special = { fg = palette.dragonOrange },

						-- experemental
						["@lsp.typemod.function.readonly"] = { fg = palette.dragonBlue },
						["@variable.member"] = { fg = palette.dragonBlue },
					}
				end,
			})
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
	-- the most minimalistic color scheme
	-- my second favourite, but it is too blue
	-- comprehension is on point as well
	-- {
	-- 	"shaunsingh/nord.nvim",
	-- 	config = function()
	-- 		vim.g.nord_italic = false
	-- 		vim.g.nord_disable_background = true
	-- 	end,
	--
	-- 	callback = function()
	-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "#262A33" })
	-- 	end,
	-- },
	--
	-- minimal, definitely not ditracting theme, but could have same side effect of being depressing
	-- too low contrasty
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
