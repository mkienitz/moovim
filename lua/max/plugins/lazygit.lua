return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension("lazygit")
    local lg = require("lazygit")
    local wk = require("which-key")
    local telescope_lg = require("telescope").extensions.lazygit
    wk.register({
      ["<leader>l"] = {
        name = "Lazygit",
        g = { function() lg.lazygit() end, "Open lazygit" },
        s = { function() telescope_lg.lazygit() end, "Select lazygit repository" },
      }
    })
  end,
}
