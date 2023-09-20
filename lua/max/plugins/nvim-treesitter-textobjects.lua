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
				keymaps = {
					["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment region" },
					["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment region" },
					["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/field region" },
					["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/field region" },
					["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional region" },
					["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },
					["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },
					["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },
					["ab"] = { query = "@block.outer", desc = "Select outer part of a block region" },
					["ib"] = { query = "@block.inner", desc = "Select inner part of a block region" },
					["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
					["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
					["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				},
				lookahead = true,
				include_surrounding_whitespace = true,
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]m"] = { query = "@function.outer", desc = "Next function start" },
					["]]"] = { query = "@class.outer", desc = "Next class start" },
				},
				goto_next_end = {
					["]M"] = { query = "@function.outer", desc = "Next function end", },
					["]["] = { query = "@class.outer", desc = "Next class ends" }
				},
				goto_previous_start = {
					["[m"] = { query = "@function.outer", desc = "Previous function start" },
					["[["] = { query = "@class.outer", desc = "Previous class start" }
				},
				goto_previous_end = {
					["[M"] = { query = "@function.outer", desc = "Previous function end" },
					["[]"] = { query = "@class.outer", desc = "Previous class end" }
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = { query = "@parameter.inner", desc = "Swap parameter with next" }
				},
				swap_previous = {
					["<leader>A"] = { query = "@parameter.inner", desc = "Swap parameter with next" }
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
