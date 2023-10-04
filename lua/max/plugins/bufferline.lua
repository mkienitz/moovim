return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	enabled = false,
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.minimal,
				diagnostics = "nvim_lsp",
				close_command = false,
				right_mouse_command = false,
				left_mouse_command = false,
				middle_mouse_command = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "neo-tree",
						separator = true,
					},
				},
				show_buffer_close_icons = false,
			},
		})
	end,
}
