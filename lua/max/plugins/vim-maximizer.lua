return {
    "szw/vim-maximizer",
    config = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>w"] = {
                name = "Window",
                m = { "<cmd>MaximizerToggle<CR>", "Toggle maximize split" }
            }
        })
    end
}
