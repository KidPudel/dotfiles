return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		-- lint.linters.golangcilint = {
		-- 	cmd = "golangci-lint", -- The actual command name
		-- 	"run",
		-- 	-- "--out-format=line-number",
		-- 	function()
		-- 		local config_file = vim.fn.getcwd() .. "/.golangci.yml"
		-- 		if vim.fn.filereadable(config_file) == 1 then
		-- 			return "--config=" .. config_file
		-- 		end
		-- 		return ""
		-- 	end,
		-- }

		lint.linters_by_ft = {
			golang = { "golangcilint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>cl", function()
			lint.try_lint()
		end, { desc = "Trigger linting" })
	end,
}
