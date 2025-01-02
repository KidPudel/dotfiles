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
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	-- priority = 1000,
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			keywordStyle = { italic = false },
	-- 		})
	-- 		-- vim.cmd("colorscheme kanagawa-dragon")
	-- 	end,
	-- },
	-- {
	-- 	"arcticicestudio/nord-vim",
	-- 	config = function() end,
	-- },
}
