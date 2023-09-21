return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"rmagatti/auto-session",
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
			},
			sections = {
				lualine_c = {
					require("auto-session.lib").current_session_name,
				},
			},
		})
	end,
}
