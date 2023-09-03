return {
  "rmagatti/auto-session",
  opts = {
    auto_restore_enabled = false,
    auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
  },
  config = function(_, opts)
    require("auto-session").setup(opts)
    local lens = require("auto-session.session-lens")
    local wk = require("which-key")
    wk.register({
      ["<leader>s"] = {
        r = { "<cmd>SessionRestore<CR>", "Restore session" },
        s = { "<cmd>SessionSave<CR>", "Save session" },
        p = { lens.search_session, "Pick session" },
        d = { "<cmd>Autosession delete<CR>", "Delete session" },
      }
    })
  end,
}
