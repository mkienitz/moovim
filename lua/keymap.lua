local M = {}

local wk = require('which-key')

wk.setup {}

wk.register({
    ['<leader>'] = {
        n = {
            name = 'nvim-tree',
            t = { '<cmd>NvimTreeToggle<cr>', 'Toggle NvimTree' },
        },
        f = {
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
        s = { '<Plug>(leap-forward-to)', 'leap-forward-to' },
        S = { '<Plug>(leap-backward-to)', 'leap-backward-to' },
        ['gs'] = { '<Plug>(leap-cross-window)', 'leap-cross-window' },
    },
})

-- Export LSP bindings
function M.set_lsp_keymap(_, bufnr)
    wk.register({
        l = {
            name = 'lsp',
            w = {
                name = 'workspace',
                a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Add workspace folder' },
                r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Remove workspace folder' },
                l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', 'List workspace folders' },
            },
            k = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover' },
            f = { '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', 'Format buffer' },
            r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol' },
            g = {
                name = 'goto',
                D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Goto declatation' },
                d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Goto definition' },
                t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Goto type definition' },
                i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Goto implementation' },
                r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'Goto references' },
            },
            a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Show code actions' },
            h = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Show signature help' }
        },
    }, {
        prefix = '<leader>',
        buffer = bufnr
    })
end

return M
