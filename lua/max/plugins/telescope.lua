return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-h>"] = actions.which_key,
          },
        },
      },
    }
  end,
  config = function(_, opts)
    require("telescope").setup(opts)
    local tsb = require("telescope.builtin")
    local wk = require("which-key")
    wk.register({
      ["<leader>f"] = {
        name = "Find",
        f = { function() tsb.find_files() end, "Local files", },
        g = { function() tsb.git_files() end, "Git files", },
        r = { function() tsb.oldfiles() end, "Old files", },
        c = { function() tsb.grep_string() end, "String under cursor", },
        s = { function() tsb.live_grep() end, "String in current working directory", },
        t = { function() tsb.treesitter() end, "Treesitter symbols", },
      },
    })
  end
}
