return {
    "theprimeagen/harpoon",
    config = function()
        local ui = require("harpoon.ui")
        local mark = require("harpoon.mark")
        local wk = require("which-key")
        local nav_file_maps = {}
        for i = 1, 9 do
            nav_file_maps[tostring(i)] = { function() ui.nav_file(i) end, "Jump to file " .. i }
        end
        wk.register({
            ["<leader>h"] = vim.tbl_extend("keep", {
                name = "Harpoon",
                n = { function() ui.nav_next() end, "Next" },
                p = { function() ui.nav_prev() end, "Previous" },
                a = { function() mark.add_file() end, "Add mark" },
                m = { function() ui.toggle_quick_menu() end, "Show Menu" },
            }, nav_file_maps)
        })
    end
}
