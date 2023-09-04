return {
	"ggandor/leap.nvim",
	opts = {
		case_sensitive = true,
	},
	config = function(_, opts)
		require("leap").setup(opts)
		local wk = require("which-key")
		wk.register({
			s = { "<Plug>(leap-forward-to)", "Leap forward" },
			S = { "<Plug>(leap-backward-to)", "Leap backward" },
			gs = { "<Plug>(leap-cross-windows)", "Leap across windows" },
		})
	end,
}
