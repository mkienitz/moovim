local gen_keys = function()
    local res = {
        {
            "<leader>ha",
            function()
                require("harpoon.mark").add_file()
            end,
            desc = "Harpoon add mark",
        },
        {
            "<leader>hm",
            function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            desc = "Harpoon show menu",
        },
        {
            "<leader>hp",
            function()
                require("harpoon.ui").nav_previous()
            end,
            desc = "Harpoon previous",
        },
        {
            "<leader>hn",
            function()
                require("harpoon.ui").nav_next()
            end,
            desc = "Harpoon next",
        },
    }
    for i = 0, 9 do
        table.insert(res, {
            "<leader>h" .. i,
            function()
                require("harpoon.ui").nav_file(i)
            end,
            desc = "Jump to file " .. i,
        })
    end
    return res
end

return {
    "theprimeagen/harpoon",
    keys = gen_keys(),
    config = true,
}
