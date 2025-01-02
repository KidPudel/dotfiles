local function live_grep_visual()
	local saved_reg = vim.fn.getreg("a")
	local saved_regtype = vim.fn.getregtype("a")

	vim.cmd('normal! "ay')
	local text = vim.fn.getreg("a")
	vim.fn.setreg("a", saved_reg, saved_regtype)

	require("telescope.builtin").live_grep({
		additional_args = { "--multiline" },
		default_text = text:gsub("\n", "\\n"):gsub("([%(%).%%%+%-%*%?%[%]%^%$%\\%{%}%|])", "\\%1"):gsub("\\\\n", "\\n"),
	})
end

-- ctrl-d/u: scroll preview
-- "text" -t <filetype>: filter by ty[]
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			-- file picker
			{ "<leader>f", "", desc = "File picker" },
			-- find files in current directory
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{
				"<leader>fh",
				"<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<cr>",
				desc = "Find files unrestricted",
			},
			-- search global accross files (grep string in current project
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Global search for string" },
			-- grep selected, instead of builtin grep_string
			{ "<leader>fg", live_grep_visual, mode = { "v" }, desc = "Global search selected" },
			-- opened
			{ "<leader>fo", "<cmd>Telescope buffers<cr>", desc = "Search for open buffers" },
			-- recent
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Search for previously opened files" },
			-- references
			{ "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "show references" },
			{ "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", desc = "show implementations" },
			-- symbols
			{ "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Buffer symbols" },
			{ "<leader>ps", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
			-- jumplist
			{ "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
			-- list previously opened files
			-- search command history
			{ "<leader>hc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
			-- search search history
			{ "<leader>hs", "<cmd>Telescope search_history<cr>", desc = "Search history" },
			-- list man, help, available commands
			-- list available color themes
			{ "<leader>kt", "<cmd>Telescope colorscheme<cr>", desc = "Available colorschemes" },
		},
		lazy = false,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
