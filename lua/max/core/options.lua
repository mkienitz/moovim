vim.o.ignorecase = true
vim.o.termguicolors = true
vim.o.smarttab = true
vim.o.encoding = "utf-8"
vim.o.clipboard = "unnamedplus"
vim.o.title = true
vim.o.updatetime = 50

vim.o.incsearch = true
vim.o.hlsearch = false

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.guicursor = ""
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.autoindent = true
vim.o.wrap = false
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

vim.o.timeout = true
vim.o.timeoutlen = 300
