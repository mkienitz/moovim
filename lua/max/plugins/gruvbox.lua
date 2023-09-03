return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        italic = {},
    },
    config = function(_, opts)
        require("gruvbox").setup(opts)
        vim.o.background = "dark"
        vim.cmd([[colorscheme gruvbox]])
    end,
}
