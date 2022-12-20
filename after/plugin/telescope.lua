local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.load_extension("fzf")
telescope.load_extension("lazygit")
telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-h>"] = actions.which_key,
			},
		},
	},
})
vim.keymap.set("n", "<leader>tf", builtin.find_files, {})
vim.keymap.set("n", "<leader>tg", builtin.git_files, {})
vim.keymap.set("n", "<leader>tt", builtin.treesitter, {})
vim.keymap.set("n", "<leader>tl", telescope.extensions.lazygit.lazygit, {})
