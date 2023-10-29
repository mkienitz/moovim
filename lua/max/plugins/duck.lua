return {
	"tamton-aquib/duck.nvim",
	opts = {},
	config = function(_, opts)
		local duck = require("duck")
		duck.setup(opts)
		local wk = require("which-key")
		wk.register({
			["<leader>x"] = {
				name = "Duck",
				d = {
					function()
						duck.hatch("🦆", 7.5)
					end,
					"Hatch duck",
				},
				c = {
					function()
						duck.hatch("🐄", 5)
					end,
					"Spawn cow",
				},
				s = {
					function()
						duck.hatch("🐑", 6)
					end,
					"Spawn sheep",
				},
				k = {
					function()
						duck.cook()
					end,
					"Cook random",
				},
			},
		})
	end,
}
