return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    keys = {
        {
            "<leader>gs",
            function()
                require("telescope").extensions.lazygit.lazygit()
            end,
            desc = "Select Lazygit repository",
        },
        {
            "<leader>gg",
            function()
                require("lazygit").lazygit()
            end,
            desc = "Open lazygit",
        },
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
}
