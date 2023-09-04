vim.opt.compatible = false
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.smarttab = true
vim.opt.encoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.title = true
vim.opt.updatetime = 50

vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.guicursor = ""
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.cmd("syntax off")

vim.o.timeout = true
vim.o.timeoutlen = 300

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
