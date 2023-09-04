return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		textobjects = {
			select = {
				enable = true,

				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment region" },
					["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment region" },

					["a:"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/field region" },
					["i:"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/field region" },

					["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional region" },
					["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },

					["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },
					["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },

					-- ["ab"] = { query = "@block.outer", desc = "Select outer part of a block region" },
					-- ["ib"] = { query = "@block.inner", desc = "Select inner part of a block region" },

					["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
					["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },

					["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				},
				include_surrounding_whitespace = true,
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>on"] = "@parameter.inner", -- swap object under cursor with next
				},
				swap_previous = {
					["<leader>op"] = "@parameter.inner", -- swap object under cursor with previous
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
