return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		-- Copilot
		{
			"zbirenbaum/copilot.lua",
			opts = {
				suggestion = { enabled = false },
				panel = { enabled = false },
			},
		},
		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "zbirenbaum/copilot-cmp", opts = {} },
		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },
		-- Formatting
		{ "jose-elias-alvarez/null-ls.nvim" },
	},
	lazy = false,
	keys = {
		{ "<leader>f", "<cmd>LspZeroFormat null-ls<cr>", desc = "Format buffer" },
	},
	config = function(_, opts)
		local lsp = require("lsp-zero").preset({})
		require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
        -- Setup Ocaml manually until Mason fixes their version
		require("lspconfig").ocamllsp.setup({})
        -- Enable feature propagation for rust analyzer
		require("lspconfig").rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					cargo = {
						features = "all",
					},
				},
			},
		})
		-- Hello, World
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-cr>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<Tab>"] = nil,
			["<S-Tab>"] = nil,
		})
		lsp.setup_nvim_cmp({
			sources = {
				{ name = "copilot", group_index = 2 },
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "buffer", group_index = 2 },
				{ name = "path", group_index = 2 },
				{ name = "luasnip", group_index = 2 },
			},
			mapping = cmp_mappings,
		})
		lsp.on_attach(function(_, bufnr)
			local km_opts = { buffer = bufnr, remap = false }
			-- lsp.default_keymaps({ buffer = bufnr })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hi" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, km_opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, km_opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, km_opts)
			vim.keymap.set("n", "go", vim.lsp.buf.type_definition, km_opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, km_opts)
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, km_opts)
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, km_opts)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, km_opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next, km_opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, km_opts)
			-- vim.keymap.set("n", "<leader>f", lsp_formatting, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, km_opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, km_opts)
			-- vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
		end)

		lsp.setup(opts)
	end,
}
