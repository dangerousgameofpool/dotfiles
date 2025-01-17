vim.g.mapleader = ' '
vim.g.localmapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.guicursor = '' -- Keep block cursor in insert, visual, etc modes
vim.opt.cursorline = true -- For transparent background, false is preferable

vim.opt.mouse = 'a'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 10

vim.opt.list = true
vim.opt.listchars = {
    tab = '  ',
    trail = '·',
    nbsp = '␣',
    eol = '↵',
}

vim.opt.splitbelow = true -- Send new horizontal splits below current pane
vim.opt.splitright = true -- Send new vertical splits to the right of the current pane

-- Navigate between splits without prepending CTRL+<w> to command.
-- Use CTRL+<hjkl> to focus left, right, etc.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Shift focus to left split.' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Shift focus to lower split.' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Shift focus to upper split.' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Shift focus to right split.' })

vim.opt.smartindent = true
vim.opt.breakindent = true

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

vim.keymap.set('t', '<esc>', '<c-\\><c-n>', { desc = 'Easier terminal use' })

vim.keymap.set('n', '<leader>t', function()
    vim.cmd.new()
    vim.cmd.wincmd('J')
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
end, { desc = 'Open terminal window at bottom with fixed height' })

-- Triggers highlighting of the copied characters when yanking text.
-- Stolen from kickstart.nvim!
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd({ 'TabNew', 'TabEnter' }, {
    desc = 'Use short tab names',
    group = vim.api.nvim_create_augroup('-custom-tab-name', { clear = true }),
    callback = function()
        local bufName = vim.api.nvim_buf_get_name(0)
        local parts = {}
        for w in string.gmatch(bufName, '[^/]+') do
            table.insert(parts, w)
        end
        print(parts)
    end,
})

vim.api.nvim_create_autocmd('TermOpen', {
    desc = 'Local default settings for new terminal buffers',
    group = vim.api.nvim_create_augroup('-term-buf-with-prefs', { clear = true }),
    callback = function()
        local set = vim.opt_local
        set.number = false
        set.relativenumber = false
        set.scrolloff = 0
    end,
})

-- Switches the editor between light and dark mode depending on the current time.
-- Light mode before 5 pm, dark mode afterwards
-- vim.api.nvim_create_autocmd({ 'VimEnter', 'BufRead' }, {
--     desc = 'Set background mode based on current time',
--     group = vim.api.nvim_create_augroup('-change-color-mode', { clear = true }),
--     callback = function()
--         local mode = 'dark' -- As a rule, default to dark mode
--         if tonumber(os.date('%H')) < 17 then
--             mode = 'light'
--         end
--         vim.opt_local.background = mode
--     end,
-- })

vim.opt.signcolumn = 'yes'

vim.opt.swapfile = false

-- Use a single statusline for every split
vim.opt.laststatus = 3

-- Mode is already displayed in the custom statusline
vim.opt.showmode = true
-- vim.opt.winbar = '%=%m %f'

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
