local set_lsp_keymap = require('lsp.common').set_lsp_keymap

require 'lspconfig'.hls.setup {
    on_attach = set_lsp_keymap
}
