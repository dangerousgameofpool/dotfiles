vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.termguicolors = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease updatetime to 200 ms
vim.opt.updatetime = 50

-- Enable access to the system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.signcolumn = "yes"

vim.opt.swapfile = false
vim.opt.laststatus = 3
vim.opt.winbar = "%=%m %f"
