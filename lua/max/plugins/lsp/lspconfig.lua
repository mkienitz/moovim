return {
    "neovim/nvim-lspconfig",
    dependencies = {
	    "nvim-telescope/telescope.nvim",
        { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
        local lspconfig = require("lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        local telescope = require("telescope.builtin")

        local on_attach = function(_, bufnr)
            local km_opts = { remap = false, silent = true, buffer = bufnr }
            km_opts.desc = "Hover documentation"
            keymap.set("n", "K", vim.lsp.buf.hover, km_opts)

            km_opts.desc = "Go to definition"
            keymap.set("n", "gd", vim.lsp.buf.definition, km_opts)

            km_opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, km_opts)

            km_opts.desc = "Go to implementation"
            keymap.set("n", "gi", vim.lsp.buf.implementation, km_opts)

            km_opts.desc = "Go to type definition"
            keymap.set("n", "go", vim.lsp.buf.type_definition, km_opts)

            km_opts.desc = "Go to references"
            keymap.set("n", "gr", vim.lsp.buf.references, km_opts)

            km_opts.desc = "Find symbol in workspace"
            keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, km_opts)

            km_opts.desc = "Show diagnostics for line"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, km_opts)

            km_opts.desc = "Show diagnostics for buffer"
            keymap.set("n", "<leader>D", telescope.diagnostics, km_opts)

            km_opts.desc = "Jump to next diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_next, km_opts)

            km_opts.desc = "Jump to previous diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_prev, km_opts)

            km_opts.desc = "Format buffer"
            keymap.set("n", "<leader>f", vim.lsp.buf.format, km_opts)

            km_opts.desc = "Show code actions"
            keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, km_opts)

            km_opts.desc = "Rename symbol"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, km_opts)
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
