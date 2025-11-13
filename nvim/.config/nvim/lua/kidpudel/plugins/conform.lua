-- formatter
return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "goimports-reviser", "gofumpt", "golines" },
				python = { "black" },
				lua = { "stylua" },
				html = { "prettier" },
				json = { "biome" },
				markdown = { "prettier" },
				javascript = { "biome" },
				typescript = { "biome" },
				gdscript = { "gdtoolkit" },
			},
			formatters = {
				golines = {
					command = "golines",
					args = { "-m", "120", "--base-formatter", "gofumpt" },
					stdin = true,
				},
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		})
		-- Helper function to check if there is a visual selection
		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })
		end, { desc = "Format file" })
	end,
}
