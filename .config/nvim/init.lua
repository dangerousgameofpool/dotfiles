vim.g.mapleader = ' '
vim.g.localmapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guicursor = ''
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 10

vim.opt.list = true
vim.opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣',
}

-- Disable arrow keys in normal mode
vim.keymap.set({ 'n', 'i', 'v' }, '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Navigate between splits without prepending CTRL+<w> to command.
-- Use CTRL+<hjkl> to focus left, right, etc.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Shift focus to left split.' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Shift focus to lower split.' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Shift focus to upper split.' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Shift focus to right split.' })

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.termguicolors = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease updatetime
vim.opt.updatetime = 50

-- Sync vim's clipboard with the system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Triggers highlighting of the copied characters when yanking text.
-- Stolen from kickstart.nvim!
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.opt.signcolumn = 'yes'

vim.opt.swapfile = false

-- Use a single statusline for every split
vim.opt.laststatus = 3

-- Move is displayed in the custom statusline
vim.opt.showmode = false
-- vim.opt.winbar = "%=%m %f"

-- Bootstrap Lazy plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugin')
