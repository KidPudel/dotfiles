vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.7.0"},
	{ src = "https://github.com/nvim-lua/plenary.nvim"},
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	-- cs"' ds" ysiw" no need to require
	{ src = "https://github.com/tpope/vim-surround" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/lopi-py/luau-lsp.nvim" },
})

require("mason").setup()

require("blink.cmp").setup({
	keymap = {
		preset = "default", -- or "super-tab" if you prefer
		-- ["<C-space>"] = { "show", "hide" },
		["<C-e>"] = { "hide" },
		["<C-y>"] = { "accept", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	signature = {enabled = true},
	fuzzy = {
        implementation = "lua",
    },
	completion = {
		menu = { auto_show = false }
	},
})


require("mason").setup()


-- Define LSP keybindings
local on_attach = function(_client, bufnr)
	local opts = { buffer = bufnr, silent = true }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>h", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(bufnr), bufnr)
	end)
end



local capabilities = require("blink.cmp").get_lsp_capabilities()
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help),
}

require("mason-lspconfig").setup({
    automatic_installation = true,
	automatic_enable = {
		exclude = { "luau_lsp" },
	},
	handlers = {
		function(server_name)
			local opts = {
				on_attach = on_attach,
				handlers = handlers,
				capabilities = capabilities
			}

			if server_name == "lua_ls" then
				opts.settings = {
					Lua = {
						hint = {
							enable = true,
							arrayindex = "enable", -- enable hints for array index
							await = true, -- hints for await
							paramName = "All", -- Hints for parameter names
							paramType = true, -- Hints for parameter types
							semicolon = "Disable", -- Disable semicolon hints
							setType = true, -- Hints for type setting
						},
					},
				}
			elseif server_name == "luau_ls" then
				opts.completion = {
					imports = {
						enabled = true, -- enable auto imports
					},
				}
			elseif server_name == "gopls" then
				opts.settings = {
					gopls = {
						hints = {
							-- assignVariableTypes = true,
							-- compositeLiteralFields = true,
							-- compositeLiteralTypes = true,
							-- constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						gofumpt = true,
						usePlaceholders = true,
						completeUnimported = true,
					},
				}
			end

			require("lspconfig")[server_name].setup(opts)
		end
	}
})
require("oil").setup({
		wrap = false,
        view_options = {
            show_hidden = true,
        }
})
require("fzf-lua").setup()
require("mini.pick").setup()
require("comment").setup({
	toggler = {
		line = "<leader>c/",
	},
	opleader = {
		line = "<leader>c/",
	},
})
require("nvim-autopairs").setup()
require("gitsigns").setup()
vim.keymap.set("n", "<leader>vh", "<cmd>Gitsigns preview_hunk<cr>")
vim.keymap.set("n", "<leader>vb", "<cmd>Gitsigns blame<cr>")

require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"lua",
		"luau",
		"go",
		"gomod",
		"gosum",
		"gowork",
		"odin",
		"python",
		"html",
		"json",
		"glsl",
		"bash",
		"gdscript",
		"godot_resource",
		"gdshader",
	},
	highlight = {
		enable = true
	},
	disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

	indent = { enable = true },
	sync_install = false,
}

require("luau-lsp").setup({
	platform = {
		type = "roblox",
	},
	types = {
		roblox_security_level = "PluginSecurity",
	},
	sourcemap = {
		enabled = true,
		autogenerate = true, -- automatic generation when the server is initialized
		rojo_project_file = "default.project.json",
		sourcemap_file = "sourcemap.json",
	},
	plugin = {
		enabled = true,
	},
})


vim.cmd("colorscheme catppuccin-mocha")

-- oil
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

-- fzf
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Files" })
vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua buffers<cr>", { desc = "Buffers (opened)" })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Old/recent files" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua grep<cr>", { desc = "Grep" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua grep_visual<cr>", { desc = "Visual Grep" })
vim.keymap.set("n", "<leader>fj", "<cmd>FzfLua jumps<cr>", { desc = "Jumps" })
vim.keymap.set("n", "<leader>fp", "<cmd>FzfLua grep<cr>", { desc = "Projects" })
vim.keymap.set("n", "<leader>fR", "<cmd>FzfLua lsp_references<cr>", { desc = "References" })
vim.keymap.set("n", "<leader>fi", "<cmd>FzfLua lsp_implementations<cr>", { desc = "Implementations" })
vim.keymap.set("n", "<leader>fd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "Definitions" })
vim.keymap.set("n", "<leader>fd", "<cmd>FzfLua lsp_declarations<cr>", { desc = "Declarations" })
vim.keymap.set("n", "<leader>cs", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Buffer symbols" })
vim.keymap.set("n", "<leader>ps", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", { desc = "Keymaps docs" })
vim.keymap.set("n", "<leader>fq", "<cmd>FzfLua quickfix<cr>", { desc = "Quickfix" })
