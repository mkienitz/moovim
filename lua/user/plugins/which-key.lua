local wk = require("which-key")

local telescope = require("telescope.builtin")

-- local telescope = require("telescope")

-- local function map(mode, lhs, rhs, opts)
-- 	local options = { noremap = true }
-- 	if opts then
-- 		options = vim.tbl_extend("force", options, opts)
-- 	end
-- 	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end
--

wk.setup({})
wk.register({
	["<C-u>"] = { "<C-u>zz", "Scroll up" },
	["<C-d>"] = { "<C-d>zz", "Scoll down" },
	["<leader>"] = {
		n = {
			name = "nvim-tree",
			t = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
		},
		f = {
			name = "telescope",
			f = { telescope.find_files, "Find files" },
			g = { telescope.git_files, "Git files" },
			t = { telescope.treesitter, "Treesitter" },
		},
		d = {
			name = "diagnostics",
			o = { vim.diagnostic.open_float, "open diagnostics" },
			["["] = { vim.diagnostic.goto_prev, "previous" },
			["]"] = { vim.diagnostic.goto_next, "next" },
			q = { vim.diagnostic.setloclist, "location list" },
		},
		l = {
			name = "lsp",
			w = {
				name = "workspace",
				a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
				r = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
				l = {
					function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end,
					"List workspace folders",
				},
			},
			k = { vim.lsp.buf.hover, "Hover" },
			f = { vim.lsp.buf.format, "Format buffer" },
			r = { vim.lsp.buf.rename, "Rename symbol" },
			g = {
				name = "goto",
				D = { vim.lsp.buf.declaration, "Goto declatation" },
				d = { vim.lsp.buf.definition, "Goto definition" },
				t = { vim.lsp.buf.type_definition, "Goto type definition" },
				i = { vim.lsp.buf.implementation, "Goto implementation" },
				r = { vim.lsp.buf.references, "Goto references" },
			},
			a = { vim.lsp.buf.code_action, "Show code actions" },
			h = { vim.lsp.buf.signature_help, "Show signature help" },
		},
	},
	s = { "<Plug>(leap-forward-to)", "leap-forward-to" },
	S = { "<Plug>(leap-backward-to)", "leap-backward-to" },
	["gs"] = { "<Plug>(leap-cross-window)", "leap-cross-window" },
})
