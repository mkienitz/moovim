return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { "c", "java", "haskell", "lua", "rust", "python", "cpp", "typescript", "scss", "svelte" },
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
