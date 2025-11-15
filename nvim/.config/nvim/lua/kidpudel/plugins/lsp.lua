return {
	-- Mason!!! manage and install lsp
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	-- ensure installed lsp
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		-- full control of setup
		-- config = function()
		--     require("mason-lspconfig").setup({
		--         ensure_installed = {
		--             "lua_ls",
		--             "gopls",
		--             "ols",
		--             "html",
		--             "jsonls",
		--             "pyright",
		--             "dockerls",
		--             "docker_compose_language_service",
		--         },
		--     })
		-- end,
	},

	-- setup the communication between nvim and lsp
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			-- lsp support
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"kevinhwang91/nvim-ufo",
		},
		opts = {
			inlay_hints = { enabled = true },
			diagnostics = { virtual_text = true },
		},
		config = function()
			-- broadcast completions to the LSPs
			-- NOTE: this is a base capabilities, for my config, i extend it in ufo plugin for folding capabilities
			local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			local folding_capabilities = vim.lsp.protocol.make_client_capabilities()
			folding_capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			local capabilities = vim.tbl_deep_extend("force", folding_capabilities, cmp_capabilities)

			local lspconfig = vim.lsp.config

			-- Add the border on hover and on signature help popup window
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			lspconfig("lua_ls", {
				capabilities = capabilities,
				handlers = handlers,
				settings = {
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
				},
			})
			lspconfig("gopls", {
				capabilities = capabilities,
				handlers = handlers,
				settings = {
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
				},
			})
			lspconfig("golangci_lint_ls", {
				capabilities = capabilities,
				handlers = handlers,
			})
			lspconfig("ols", {
				capabilities = capabilities,
				handlers = handlers,
			})
			lspconfig("html", {
				capabilities = capabilities,
				handlers = handlers,
			})
			lspconfig("jsonls", {
				capabilities = capabilities,
				handlers = handlers,
			})
			lspconfig("pyright", {
				capabilities = capabilities,
				handlers = handlers,
			})
			lspconfig("dockerls", {
				capabilities = capabilities,
				handlers = handlers,
			})
			lspconfig("docker_compose_language_service", {
				capabilities = capabilities,
				handlers = handlers,
			})
			lspconfig("luau_lsp", {
				capabilities = capabilities,
				handlers = handlers,
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
			})
			-- lspconfig("gdscript", {
			-- 	capabilities = capabilities,
			-- 	handlers = handlers,
			-- })
			-- vim.keymap.set("n", "<leader>gs", function()
			-- 	vim.fn.serverstart("127.0.0.1:6005")
			-- end)

			-- only on lsp attaches to the buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				-- group = vim.api.nvim_create_aigroup("UserLspConfig", {}),
				callback = function(ev)
					-- buffer local mappings
					local opts = { buffer = ev.buf }
					local bufnr = { bufnr = ev.buf }
					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- if inlay supported
					if client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true, bufnr)
						-- print("Inlay hint is enabled for the buffer: ", vim.lsp.inlay_hint.is_enabled(bufnr))
					end

					-- context bar
					-- if client.server_capabilities.documentSymbolProvider then
					--     require("nvim-navic").attach(client, ev.buf)
					-- end

					-- global bindings
					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover({ border = border })
					end, opts)
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
				end,
			})
		end,
	},

	-- links to the lsp
	{
		"icholy/lsplinks.nvim",
		config = function()
			local lsplinks = require("lsplinks")
			lsplinks.setup()
			vim.keymap.set("n", "gx", lsplinks.gx)
		end,
	},
}
