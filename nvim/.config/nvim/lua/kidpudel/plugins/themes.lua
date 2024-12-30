return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
			})
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1001,
		config = function()
			require("kanagawa").setup({
				theme = "dragon",
			})
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
}
