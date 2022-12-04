local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- General
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "<C-d>", "<C-d>zz", { silent = true })

-- Whichkey
wk.setup({})
wk.register({
	["<leader>"] = {
		n = {
			name = "nvim-tree",
			t = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
		},
		f = {
			name = "telescope",
			f = { "<cmd>Telescope find_files<cr>", "Find files" },
			g = { "<cmd>Telescope git_files<cr>", "Git files" },
			t = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
		},
		d = {
			name = "diagnostics",
			o = { "<cmd>lua vim.diagnostic.open_float()<cr>", "open diagnostics" },
			["["] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "previous" },
			["]"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "next" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "location list" },
		},
		l = {
			name = "lsp",
			w = {
				name = "workspace",
				a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace folder" },
				r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace folder" },
				l = {
					"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
					"List workspace folders",
				},
			},
			k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
			f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format buffer" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
			g = {
				name = "goto",
				D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto declatation" },
				d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition" },
				t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Goto type definition" },
				i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto implementation" },
				r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Goto references" },
			},
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Show code actions" },
			h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature help" },
		},
		-- x = {
		-- 	name = "trouble",
		-- 	x = { "<cmd>TroubleToggle<cr>", "toggle" },
		-- 	w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
		-- 	d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
		-- 	q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
		-- 	l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
		-- 	r = { "<cmd>TroubleToggle lsp_references<cr>", "lsp references" },
		-- },
	},
	s = { "<Plug>(leap-forward-to)", "leap-forward-to" },
	S = { "<Plug>(leap-backward-to)", "leap-backward-to" },
	["gs"] = { "<Plug>(leap-cross-window)", "leap-cross-window" },
})
