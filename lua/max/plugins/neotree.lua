return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"theprimeagen/harpoon",
		"s1n7ax/nvim-window-picker",
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "MunifTanjim/nui.nvim" },
	},
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
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
		window = {
			position = "left",
			width = 34,
			auto_expand_width = false,
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					".git",
				},
				hide_by_pattern = {
					--"*.meta",
					--"*/src/*/tsconfig.json"
				},
				always_show = {
					--".gitignored",
				},
				never_show = {
					".DS_Store",
				},
				never_show_by_pattern = {
					--".null-ls_*",
				},
			},
			group_empty_dirs = true,
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
			hijack_netrw_behavior = "open_default",
			use_libuv_file_watcher = false,
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
					{ "harpoon_index" },
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
