local set_lsp_keymap = require('lsp.common').set_lsp_keymap

require'lspconfig'.pyright.setup{
    on_attach = set_lsp_keymap,
}

