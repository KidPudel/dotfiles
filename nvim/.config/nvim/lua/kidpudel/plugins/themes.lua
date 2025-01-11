local function colorFeelAccurate(palette)
	return {
		String = { italic = true },
		Boolean = { fg = palette.dragonPink },
		Constant = { fg = palette.dragonPink },

		Identifier = { fg = palette.dragonBlue },
		Statement = { fg = palette.dragonBlue }, -- logic, focus
		Operator = { fg = palette.dragonGray2 },
		Keyword = { fg = palette.dragonRed }, -- strength of builtin keywords (core)
		-- Function = { fg = palette.dragonGreen }, -- v1. i like green functions
		-- Function = { fg = palette.dragonGreen2 }, -- v2. action
		-- Function = { fg = palette.autumnGreen }, -- v2. action
		Function = { fg = palette.dragonGreen2 }, -- v2. action

		-- Type = { fg = palette.dragonYellow }, -- v1. creativity of custom types
		--Type = { fg = palette.dragonGreen }, -- v2. Newness
		Type = { fg = palette.dragonYellow }, -- v2. Newness, but more subtle

		-- Special = { fg = palette.dragonOrange }, -- v1. which emphesises the maturity over the new types
		Special = { fg = palette.dragonYellow }, -- v2. cheers, that this type is builtin

		["@lsp.typemod.function.readonly"] = { fg = palette.dragonBlue },
		["@variable.member"] = { fg = palette.dragonBlue },

		["@namespace"] = { fg = palette.dragonWhite },
	}
end

local function minimalisticColors(palette)
	return {
		String = { italic = true },

		Operator = { fg = palette.dragonGray2 },

		-- static
		Boolean = { fg = palette.dragonPink },
		Constant = { fg = palette.dragonPink },
		Number = { fg = palette.dragonPink },

		-- hard
		Keyword = { fg = palette.dragonRed }, -- strength of builtin keywords (core)

		-- functions
		Function = { fg = palette.dragonOrange }, -- action
		["@function.builtin"] = { fg = palette.dragonOrange },
		["@lsp.type.magicFunction"] = { fg = palette.dragonOrange },
		["@lsp.typemod.function.builtin"] = { fg = palette.dragonOrange },
		["@lsp.typemod.function.defaultLibrary"] = { fg = palette.dragonOrange },
		["@lsp.typemod.method.defaultLibrary"] = { fg = palette.dragonOrange },
		["@lsp.typemod.function.readonly"] = { fg = palette.dragonOrange },

		-- types
		Type = { fg = palette.dragonYellow }, -- creativity, data structure
		Special = { fg = palette.dragonYellow }, -- creativity, data structure

		-- parameters/members
		Identifier = { fg = palette.dragonBlue2 },
		Statement = { fg = palette.dragonBlue2 }, -- logic, focus
		-- ["@lsp.typemod.function.readonly"] = { fg = palette.dragonBlue },
		["@variable.member"] = { fg = palette.dragonBlue3 },

		-- variables
		-- increase readability, fujiWhite blends too much
		["@namespace"] = { fg = palette.dragonWhite },
		["@variable.builtin"] = { fg = palette.dragonRed },
		["@variable.parameter"] = { fg = palette.dragonWhite },
		["@variable"] = { fg = palette.dragonWhite },
		["@attribute"] = { fg = palette.dragonWhite },
	}
end

return {
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
					-- return colorFeelAccurate(palette)
					return minimalisticColors(palette)
				end,
			})
			-- vim.cmd("colorscheme kanagawa-dragon")
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
				},
			})
		end,
	},
	{
		"https://github.com/RRethy/base16-nvim",
		config = function()
			local bg = "#0F1919"
			local accent = "#102121"
			local accent2 = "#0D2525" -- highlight

			local text = "#abb2bf"
			local dark_text = "#3E4451" -- comments, line numbers

			-- great combination, not too far from each other, vibrance level similar
			local keyword = "#8F939A"
			local func = "#B6AB8B"
			local types = "#65838E"
			local constant = "#A06057"

			local for_tesing = "#FF0000"

			-- green knight. 00s music inpired, rainy Vancoover, Jonathan Blow, yes science.
			require("base16-colorscheme").setup({
				base00 = bg, -- bg
				base01 = accent, -- accent, selection from suggestions, color of text when search,
				base02 = accent2, -- accent2, bar, selection, highlights, hightlight when suggestion, bg hightlight suggestions
				base03 = dark_text, -- comments, hints.
				base04 = dark_text, -- line numbers, hints in suggestions on what is it besides the tipe
				base05 = text, -- text, normal mode
				base06 = for_tesing, -- ?
				base07 = for_tesing, -- ?
				base08 = text, -- variables, parameter of a variable, errors??, command mode
				base09 = constant, -- constant. brownish, stability, reliablitiy and simplicity
				base0A = types, -- all types
				base0B = constant, -- strings. blueish for stability and reliablity
				base0C = text, -- type hint/support, fields, visual mode
				base0D = func, -- function, methods, attrubute IDs, markup heading
				base0E = keyword, -- keyword and more
				base0F = text, -- delimiters , .
			})
			-- vim.cmd("colorscheme base16")
		end,
	},
}
