-- Global options
vim.go.compatible = false
vim.go.ignorecase = true
vim.go.termguicolors = true
vim.go.smarttab = true
vim.go.encoding = 'utf-8'
vim.go.clipboard = 'unnamedplus'
vim.go.title = true
vim.go.updatetime = 250

-- Windows options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

-- Buffer options
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.cmd('colorscheme gruvbox')
