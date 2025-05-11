return {
	{
		"https://github.com/RRethy/base16-nvim",
		config = function()
			local function require_green_knight(is_dark)
				local green_knight_dark = {
					bg = "#0F1919",
					accent = "#102121",
					accent2 = "#0D2525", -- highlight
					text = "#ABB2BF",
					dark_text = "#3E4451", -- comments, line numbers comment = "#48955D", -- jblows approach on making comments important, resulting in mindfulness of the comment
					-- great combination, not too far from each other, vibrance level similar
					keyword = "#8F939A",
					func = "#B6AB8B",
					types = "#65838E",
					constant = "#A06057",
					for_tesing = "#FF0000",
				}

				local green_knight_light = {
					bg = "#C3C8BE", -- Soft overcast gray (unchanged)
					accent = "#A0B19F", -- Slightly darker muted green
					accent2 = "#9EAE99", -- Subtle highlight
					text = "#1C1F1E", -- Very dark green-gray (high contrast, ~12:1)
					dark_text = "#3C4644", -- Secondary UI text (comments, linenrs)
					comment = "#447A63", -- Deeper forest green (keeps importance but readable now)
					keyword = "#254A6D", -- Darker muted blue (e.g., `if`, `for`, etc.)
					func = "#7C5E00", -- Updated deep gold (improved)
					types = "#3D5F72", -- Darker steel blue for type identifiers
					constant = "#8C3D30", -- Rich clay red for consts
					for_testing = "#FF0000", -- unchanged
				}
				local t = green_knight_dark
				if not is_dark then
					t = green_knight_light
				end

				-- green knight. 00s music inpired, rainy Vancoover, Jonathan Blow, yes science.
				require("base16-colorscheme").setup({
					base00 = t.bg, -- bg
					base01 = t.accent, -- accent, selection from suggestions, color of text when search,
					base02 = t.accent2, -- accent2, bar, selection, highlights, hightlight when suggestion, bg hightlight suggestions
					base03 = t.comment, -- comments, hints.
					base04 = t.dark_text, -- line numbers, hints in suggestions on what is it besides the tipe
					base05 = t.text, -- text, normal mode
					base06 = t.for_tesing, -- ?
					base07 = t.for_tesing, -- ?
					base08 = t.text, -- variables, parameter of a variable, errors??, command mode
					base09 = t.constant, -- constant. brownish, stability, reliablitiy and simplicity
					base0A = t.types, -- all types
					base0B = t.constant, -- strings. blueish for stability and reliablity
					base0C = t.text, -- type hint/support, fields, visual mode
					base0D = t.func, -- function, methods, attrubute IDs, markup heading
					base0E = t.keyword, -- keyword and more
					base0F = t.text, -- delimiters , .
				})
			end

			require_green_knight(true)
			vim.keymap.set("n", "<leader>td", function()
				require_green_knight(true)
			end, { desc = "switch theme dark/light" })
			vim.keymap.set("n", "<leader>tl", function()
				require_green_knight(false)
			end, { desc = "switch theme dark/light" })
		end,
	},
}
