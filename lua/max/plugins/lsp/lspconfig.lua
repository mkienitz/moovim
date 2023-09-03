return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local wk = require("which-key")
        local telescope = require("telescope.builtin")

        local on_attach = function(_, bufnr)
            wk.register({
                ["<leader>"] = {
                    K = { vim.lsp.buf.hover, "Hover documentation", buffer = bufnr },
                    g = {
                        name = "Go to",
                        d = { vim.lsp.buf.definition, "Definition", buffer = bufnr },
                        D = { vim.lsp.buf.declaration, "Declaration", buffer = bufnr },
                        i = { vim.lsp.buf.implementation, "Implementation", buffer = bufnr },
                        o = { vim.lsp.buf.type_definition, "Type definition", buffer = bufnr },
                        r = { vim.lsp.buf.references, "References", buffer = bufnr },
                    },
                    ["["] = { vim.diagnostic.goto_next, "Jump to next diagnostic", buffer = bufnr },
                    ["]"] = { vim.diagnostic.goto_prev, "Jump to previous diagnostic", buffer = bufnr },
                    ca = { vim.lsp.buf.code_action, "Show code actions", buffer = bufnr },
                    rn = { vim.lsp.buf.rename, "Rename symbol", buffer = bufnr },
                    vws = { vim.lsp.buf.workspace_symbol, "Find symbol in workspace", buffer = bufnr },
                    d = { vim.diagnostic.open_float, "Show diagnostics for line", buffer = bufnr },
                    D = { telescope.diagnostics, "Show diagnostics for buffer", buffer = bufnr },
                    F = { vim.lsp.buf.format, "Format buffer", buffer = bufnr },
                }
            })
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        }
                    },
                },
            },
        })

        lspconfig.nil_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
}
