local set_lsp_keymap = require('lsp.common').set_lsp_keymap
require 'lspconfig'.jdtls.setup {
    on_attach = set_lsp_keymap
}
