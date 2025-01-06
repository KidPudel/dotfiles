return {
	-- if this theme is works for you, no need to second guessing the color scheme and waste time on this bs.
	-- It’s a good to always be evolving, always willing to let go of the comfortable old way to discover a better new way.
	-- main
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
	-- for late sessions
	{
		"rebelot/kanagawa.nvim",
	},
}
