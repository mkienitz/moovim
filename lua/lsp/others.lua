local set_keybinds = require('keymap').lsp_on_attach


local servers = { 'pyright', 'ccls' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = set_keybinds,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
        }
    }
end
