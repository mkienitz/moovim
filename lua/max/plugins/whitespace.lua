return {
    "ntpeters/vim-better-whitespace",
    keys = {
        {
            "<leader>$",
            function()
                vim.cmd("StripWhitespace")
            end,
            desc = "Strip whitespace",
        },
    }
}
