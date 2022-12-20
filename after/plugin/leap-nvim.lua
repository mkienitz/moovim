require("leap").setup({
    case_sensitive = true,
})
vim.keymap.set("n", "s", "<Plug>(leap-forward-to)")
vim.keymap.set("n", "S", "<Plug>(leap-backward-to)")
vim.keymap.set("n", "gs", "<Plug>(leap-cross-windows)")
