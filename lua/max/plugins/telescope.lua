return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find local files",
        },
        {
            "<leader>fc",
            function()
                require("telescope.builtin").grep_string()
            end,
            desc = "Grep string under cursor",
        },
        {
            "<leader>fs",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Grep string in current working directory",
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Find Git files",
        },
        {
            "<leader>ft",
            function()
                require("telescope.builtin").treesitter()
            end,
            desc = "Symbols",
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
}
