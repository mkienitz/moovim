local M = {}
-- local opts = { noremap = true, silent = true }

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
    prefix = '<leader>'
})

-- Export LSP bindings
function M.lsp_on_attach(_, bufnr)
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
            f = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'Format buffer' },
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

-- function M.lsp_on_attach(_, bufnr)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
-- 		'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
-- end

return M
