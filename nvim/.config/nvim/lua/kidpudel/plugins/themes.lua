return {
	--{
	--	"mellow-theme/mellow.nvim",
	--	name = "mellow",
	--	priority = 1000,
	--	config = function ()
	--		vim.cmd("colorscheme mellow")
	--	end
	--},

	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			contrast = "hard",
	-- 		})
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	{
		"ebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				theme = "wave",
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			--contrast = "hard",
	-- 		})
	-- 		vim.cmd("colorscheme catppuccin")
	-- 	end,
	-- },
}
