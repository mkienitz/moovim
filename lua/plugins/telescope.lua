return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	keys = {
		{
			"<leader>tf",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Local files",
		},
		{
			"<leader>tg",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "Git files",
		},
		{
			"<leader>tt",
			function()
				require("telescope.builtin").treesitter()
			end,
			desc = "Symbols",
		},
		{
			"<leader>tl",
			function()
				require("telescope").extensions.lazygit.lazygit()
			end,
			desc = "Lazygit",
		},
	},
	opts = function()
		local actions = require("telescope.actions")
		return {
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-h>"] = actions.which_key,
					},
				},
			},
		}
	end,
}
