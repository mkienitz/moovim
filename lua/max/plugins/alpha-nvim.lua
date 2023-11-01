return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			[[                          _    ___            ]],
			[[     ____ ___  ____  ____| |  / (_)___ ___    ]],
			[[    / __ `__ \/ __ \/ __ \ | / / / __ `__ \   ]],
			[[   / / / / / / /_/ / /_/ / |/ / / / / / / /   ]],
			[[  /_/ /_/ /_/\____/\____/|___/_/_/ /_/ /_/    ]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New File", "<cmd>ene<CR>"),
			dashboard.button("SPC e", "  Toggle File Explorer"),
			dashboard.button("SPC ff", "󰱼  Local Files"),
			dashboard.button("SPC fg", "  Git Files"),
			dashboard.button("SPC fr", "󱋢  Recent Files"),
			dashboard.button("SPC fs", "  Find String"),
			dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
		}
		alpha.setup(dashboard.opts)
	end,
}
