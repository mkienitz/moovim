local wk = require('which-key')
wk.setup {}

wk.register({
    n = {
        name = 'nvim-tree',
        t = { '<cmd>NvimTreeToggle<cr>', 'Toggle NvimTree' },
    },
    t = {
        name = 'telescope',
        f = { '<cmd>Telescope find_files<cr>', 'Find files' },
        g = { '<cmd>Telescope git_files<cr>', 'Git files' },
        t = { '<cmd>Telescope treesitter<cr>', 'Treesitter' },
    },
    d = {
        name = 'diagnostics',
        o = { '<cmd>lua vim.diagnostic.open_float()<cr>', 'open diagnostics' },
        ['['] = { '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'previous' },
        [']'] = { '<cmd>lua vim.diagnostic.goto_next()<cr>', 'next' },
        q = { '<cmd>lua vim.diagnostic.setloclist()<cr>', 'location list' },
    },
}, {
    prefix = '<space>'
})
