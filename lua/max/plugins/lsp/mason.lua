return {
    "williamboman/mason.nvim",
    priority = 500,
    dependencies = {
        "neovim/nvim-lspconfig",
        { "williamboman/mason-lspconfig.nvim", }
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "nil_ls",
            },
            automatic_installation = true,
        })
    end,
}
