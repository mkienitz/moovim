local set_lsp_keymap = require('lsp.common').set_lsp_keymap
require 'lspconfig'.astro.setup {
    on_attach = set_lsp_keymap
}
