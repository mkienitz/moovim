local actions = require("telescope.actions")
-- local trouble = require("trouble.providers.telescope")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-h>"] = actions.which_key,
				-- ["<c-t>"] = trouble.open_with_trouble,
			},
			-- n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
})

require("telescope").load_extension("fzf")
