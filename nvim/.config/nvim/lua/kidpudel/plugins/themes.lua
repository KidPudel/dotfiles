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
		["@variable.member"] = { fg = palette.dragonBlue2 },

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
					LspInlayHint = { bg = palette.yellow },
				},
			})
		end,
	},
}
