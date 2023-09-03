return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = {
      width = 35,
      relativenumber = true,
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {
      custom = { ".DS_Store" },
    },
    git = {
      ignore = false,
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    local nvt = require("nvim-tree.api")
    local wk = require("which-key")
    wk.register({
      ["<leader>e"] = {
        name = "Explorer",
        e = { nvt.tree.toggle, "Toggle" },
        f = { function() nvt.tree.toggle({ find_file = true, focus = true }) end, "Toggle on current file" },
        c = { function() nvt.tree.collapse_all(false) end, "Collapse folder" },
        r = { nvt.tree.reload, "Refresh" },
      }
    })
  end,
}
