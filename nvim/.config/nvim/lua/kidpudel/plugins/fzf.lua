return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {
		keymap = {
			{ "<leader>p", "", desc = "File picker" },
			{ "<leader>pf", "<cmd>FzfLua files<cr>", desc = "File picker" },
		},
	},
}
