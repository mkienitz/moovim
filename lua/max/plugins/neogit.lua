return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
	enabled = false,
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
	},
	opts = {},
}
