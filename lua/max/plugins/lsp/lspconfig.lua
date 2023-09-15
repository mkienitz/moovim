return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp", "mfussenegger/nvim-dap", "simrat39/rust-tools.nvim" },
	},
	config = function()
		-- Prepare keybinds on attach
		local wk = require("which-key")
		local on_attach = function(_, bufnr)
			wk.register({
				K = { vim.lsp.buf.hover, "Hover documentation", buffer = bufnr },
				g = {
					d = { vim.lsp.buf.definition, "Definition", buffer = bufnr },
					D = { vim.lsp.buf.declaration, "Declaration", buffer = bufnr },
					i = { vim.lsp.buf.implementation, "Implementation", buffer = bufnr },
					o = { vim.lsp.buf.type_definition, "Type definition", buffer = bufnr },
					r = { vim.lsp.buf.references, "References", buffer = bufnr },
				},
				["[d"] = { vim.diagnostic.goto_next, "Jump to next diagnostic", buffer = bufnr },
				["]d"] = { vim.diagnostic.goto_prev, "Jump to previous diagnostic", buffer = bufnr },
				["<leader>"] = {
					a = { vim.lsp.buf.code_action, "Show code actions", buffer = bufnr },
					rn = { vim.lsp.buf.rename, "Rename symbol", buffer = bufnr },
					vws = { vim.lsp.buf.workspace_symbol, "Find symbol in workspace", buffer = bufnr },
					d = { vim.diagnostic.open_float, "Show diagnostics for line", buffer = bufnr },
					D = { require("telescope.builtin").diagnostics, "Show diagnostics for buffer", buffer = bufnr },
					F = { vim.lsp.buf.format, "Format buffer", buffer = bufnr },
				},
			})
		end
		-- Prepare capabilities and handlers
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		-- Dedicated handlers
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig.hls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		local rust_tools = require("rust-tools");
		rust_tools.setup({
			server = {
				capabilities = capabilities,
				on_attach = on_attach,
			}
		})
	end,
}
