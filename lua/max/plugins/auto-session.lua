return {
  "rmagatti/auto-session",
  opts = {
    auto_restore_enabled = false,
    auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Deskeop/" },
  },
  config = function(_, opts)
    require("auto-session").setup(opts)
    local wk = require("which-key")
    wk.register({
      ["<leader>s"] = {
        r = { "<cmd>SessionRestore<CR>", "Restore session" },
        s = { "<cmd>SessionSave<CR>", "Save session" },
      }
    })
  end,
}
