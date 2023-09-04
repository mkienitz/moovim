return {
	"s1n7ax/nvim-window-picker",
	config = function()
		local window_picker = require("window-picker")
		window_picker.setup({
			show_prompt = false,
			hint = "floating-big-letter",
			filter_rules = {
				autoselect_one = true,
				include_current_win = false,
				bo = {
					filetype = { "neo-tree", "neo-tree-popup", "notify" },
					buftype = { "terminal", "quickfix", "prompt" },
				},
			},
			floating_big_letter = {
				font = "ansi-shadow",
			},
		})

		local wk = require("which-key")
		wk.register({
			["<C-w><space>"] = { window_picker.pick_window, "Open window picker" },
		})
	end,
}
