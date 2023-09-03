return {
  "mbbill/undotree",
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>u"] = { "<cmd>UndotreeToggle<CR>", "Toggle UndoTree" },
    })
  end
}
