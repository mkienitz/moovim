local ui = function()
    return require("harpoon.ui")
end

return {
	"theprimeagen/harpoon",
    keys = {
        {"<leader>a", function()
            require("harpoon.mark").add_file()
         end,
         desc = "Mark file"},
        {"<C-e>",function()
            ui().toggle_quick_menu()
         end,
         desc = "Toggle menu"},
        {"<C-h>", function()
            ui().nav_file(1)
         end,
         desc = "Jump to file 1"},
        {"<C-j>", function()
            ui().nav_file(2)
         end,
         desc = "Jump to file 2"},
        {"<C-k>", function()
            ui().nav_file(3)
         end,
         desc = "Jump to file 3"},
        {"<C-l>", function()
            ui().nav_file(4)
         end,
         desc = "Jump to file 4"},
    },
    config = true,
}
