return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { "c", "java", "haskell", "lua", "rust", "python", "cpp", "typescript", "scss", "svelte" },
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
