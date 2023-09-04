return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"theprimeagen/harpoon",
		"s1n7ax/nvim-window-picker",
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" }, -- not strictly required, but recommended
		{ "MunifTanjim/nui.nvim" },
	},
	opts = {
		close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
		popup_border_style = "rounded", -- "double", "none", "rounded", "shadow", "single" or "solid"
		default_component_configs = {
			container = {
				enable_character_fade = false,
				width = "100%",
				right_padding = 0,
			},
			git_status = {
				symbols = {
					added = "A",
					deleted = "D",
					modified = "M",
					renamed = "R",
					untracked = "?",
					ignored = "I",
					unstaged = "U",
					staged = "S",
					conflict = "X",
				},
			},
		},
		window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
			-- possible options. These can also be functions that return these options.
			position = "left", -- left, right, top, bottom, float, current
			width = 34, -- applies to left and right positions
			auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					".git",
				},
				hide_by_pattern = { -- uses glob style patterns
					--"*.meta",
					--"*/src/*/tsconfig.json"
				},
				always_show = { -- remains visible even if other settings would normally hide it
					--".gitignored",
				},
				never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
					".DS_Store",
				},
				never_show_by_pattern = { -- uses glob style patterns
					--".null-ls_*",
				},
			},
			group_empty_dirs = true, -- when true, empty folders will be grouped together
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
			use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
			components = {
				harpoon_index = function(config, node, _)
					local mark = require("harpoon.mark")
					local path = node:get_id()
					local success, index = pcall(mark.get_index_of, path)
					if success and index and index > 0 then
						return {
							text = string.format(" 󰛢 %d", index),
							highlight = config.highlight or "NeoTreeDirectoryIcon",
						}
					else
						return {}
					end
				end,
			},
			renderers = {
				file = {
					{ "icon" },
					{ "name", use_git_status_colors = true },
					{ "harpoon_index" }, -- This is what actually adds the component in where you want it
					{ "diagnostics" },
					{ "git_status", highlight = "NeoTreeDimText" },
				},
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		local wk = require("which-key")
		wk.register({
			["<leader>"] = {
				e = { "<cmd>Neotree action=show toggle<CR>", "Toggle explorer" },
			},
		})
	end,
}
