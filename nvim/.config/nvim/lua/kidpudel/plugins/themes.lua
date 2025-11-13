return {
	-- green_knight(),
	{
		"aktersnurra/no-clown-fiesta.nvim",
		config = function()
			-- require("rasmus").setup({})
			-- vim.cmd.colorscheme("vscode")
			vim.keymap.set("n", "<leader>km", function()
				vim.cmd.colorscheme("no-clown-fiesta")
			end, { desc = "no clown fiesta" })
		end,
	},
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				background = {
					light = "latte",
					dark = "mocha",
				},
			})
			vim.cmd.colorscheme("catppuccin")
			vim.keymap.set("n", "<leader>kd", function()
				vim.o.background = "dark"
			end, { desc = "dark mode" })
			vim.keymap.set("n", "<leader>kl", function()
				vim.o.background = "light"
			end, { desc = "light mode" })
			vim.keymap.set("n", "<leader>kk", function()
				vim.cmd.colorscheme("catppuccin")
			end, { desc = "default" })
		end,
	},
}
--		"vague2k/vague.nvim",

-- local function green_knight()
-- 	return {
-- 		"https://github.com/RRethy/base16-nvim",
-- 		config = function()
-- 			local function require_green_knight(is_dark)
-- 				local green_knight_dark = {
-- 					bg = "#0F1919",
-- 					accent = "#102121",
-- 					accent2 = "#0D2525", -- highlight
-- 					text = "#ABB2BF",
-- 					dark_text = "#3E4451",
-- 					comment = "#48955D",
-- 					keyword = "#8F939A",
-- 					func = "#B6AB8B",
-- 					types = "#65838E",
-- 					constant = "#A06057",
-- 					for_tesing = "#FF0000",
-- 				}
-- 				-- good light
-- 				local green_knight_light = {
-- 					bg = "#E8EDE5", -- very light, almost white with green tint
-- 					accent = "#D0D9CF", -- adjusted proportionally
-- 					accent2 = "#CBDACA", -- adjusted proportionally
-- 					text = "#3A453A", -- softer dark green instead of harsh black
-- 					dark_text = "#5A6B5A", -- warmer secondary text
-- 					comment = "#2A7A4F", -- less harsh green but still prominent
-- 					keyword = "#5A6B6F", -- softer blue-gray
-- 					func = "#8B6F00", -- warmer gold, less stark
-- 					types = "#3F5F7A", -- softer steel blue
-- 					constant = "#9A5048", -- warmer red-brown, less harsh
-- 					for_testing = "#FF0000",
-- 				}
-- 				local t = green_knight_dark
-- 				if not is_dark then
-- 					t = green_knight_light
-- 				end
--
-- 				-- green knight. 00s music inpired, rainy Vancoover, Jonathan Blow, yes science.
-- 				require("base16-colorscheme").setup({
-- 					base00 = t.bg, -- bg
-- 					base01 = t.accent, -- accent, selection from suggestions, color of text when search,
-- 					base02 = t.accent2, -- accent2, bar, selection, highlights, hightlight when suggestion, bg hightlight suggestions
-- 					base03 = t.comment, -- comments, hints.
-- 					base04 = t.dark_text, -- line numbers, hints in suggestions on what is it besides the tipe
-- 					base05 = t.text, -- text, normal mode
-- 					base06 = t.for_tesing, -- ?
-- 					base07 = t.for_tesing, -- ?
-- 					base08 = t.text, -- variables, parameter of a variable, errors??, command mode
-- 					base09 = t.constant, -- constant. brownish, stability, reliablitiy and simplicity
-- 					base0A = t.types, -- all types
-- 					base0B = t.constant, -- strings. blueish for stability and reliablity
-- 					base0C = t.text, -- type hint/support, fields, visual mode
-- 					base0D = t.func, -- function, methods, attrubute IDs, markup heading
-- 					base0E = t.keyword, -- keyword and more
-- 					base0F = t.text, -- delimiters , .
-- 				})
-- 			end
--
-- 			require_green_knight(true)
--
-- 			vim.keymap.set("n", "<leader>kk", function()
-- 				require_green_knight(vim.o.background == "dark")
-- 			end)
--
-- 			-- general
-- 			vim.keymap.set("n", "<leader>kd", function()
-- 				vim.o.background = "dark"
-- 				require_green_knight(true)
-- 			end, { desc = "dark mode" })
-- 			vim.keymap.set("n", "<leader>kl", function()
-- 				vim.o.background = "light"
-- 				require_green_knight(false)
-- 			end, { desc = "light mode" })
-- 		end,
-- 	}
-- end
