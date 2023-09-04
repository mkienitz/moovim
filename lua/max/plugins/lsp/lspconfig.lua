return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", },
    { "williamboman/mason-lspconfig.nvim", },
    { "hrsh7th/cmp-nvim-lsp" },
  },
  config = function()
    -- Prepare keybinds on attach
    local wk = require("which-key")
    local on_attach = function(_, bufnr)
      wk.register({
        K = { vim.lsp.buf.hover, "Hover documentation", buffer = bufnr },
        g = {
          d = { vim.lsp.buf.definition, "Definition", buffer = bufnr },
          D = { vim.lsp.buf.declaration, "Declaration", buffer = bufnr },
          i = { vim.lsp.buf.implementation, "Implementation", buffer = bufnr },
          o = { vim.lsp.buf.type_definition, "Type definition", buffer = bufnr },
          r = { vim.lsp.buf.references, "References", buffer = bufnr },
        },
        ["[d"] = { vim.diagnostic.goto_next, "Jump to next diagnostic", buffer = bufnr },
        ["]d"] = { vim.diagnostic.goto_prev, "Jump to previous diagnostic", buffer = bufnr },
        ["<leader>"] = {
          ca = { vim.lsp.buf.code_action, "Show code actions", buffer = bufnr },
          rn = { vim.lsp.buf.rename, "Rename symbol", buffer = bufnr },
          vws = { vim.lsp.buf.workspace_symbol, "Find symbol in workspace", buffer = bufnr },
          d = { vim.diagnostic.open_float, "Show diagnostics for line", buffer = bufnr },
          D = { require("telescope.builtin").diagnostics, "Show diagnostics for buffer", buffer = bufnr },
          F = { vim.lsp.buf.format, "Format buffer", buffer = bufnr },
        }
      })
    end
    -- Prepare capabilities and handlers
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    local handlers = {
      -- Default handler
      function(server_name) -- default handler (optional)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,
      -- Dedicated handlers
      ["lua_ls"] = function()
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
      end,
    }
    -- Setup - Mason must start first
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "nil_ls",
      },
      automatic_installation = true,
      handlers = handlers,
    })
  end,
}
