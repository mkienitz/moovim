return {
	"tamton-aquib/duck.nvim",
	keys = {
		{
			"<leader>dd",
			function()
				require("duck").hatch("🦆", 7.5)
			end,
			desc = "Hatch duck",
		},
		{
			"<leader>dc",
			function()
				require("duck").hatch("🐄", 5)
			end,
			desc = "Spawn cow",
		},
		{
			"<leader>ds",
			function()
				require("duck").hatch("🐑", 6)
			end,
			desc = "Spawn sheep",
		},
		{
			"<leader>dk",
			function()
				require("duck").cook()
			end,
			desc = "Cook random",
		},
	},
}
