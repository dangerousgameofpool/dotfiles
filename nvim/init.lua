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
    eol = '󰌑',
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
    vim.cmd.wincmd 'J'
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
    vim.cmd.startinsert()
end, { desc = 'Open terminal window at bottom with fixed height' })

-- TODO: WIP floating terminal window
vim.keymap.set('n', '<leader>ft', function()
    local bufnr = vim.api.nvim_create_buf(false, true)
    local width, height = 150, 100
    local win_id = vim.api.nvim_open_win(bufnr, true, {
        relative = 'win',
        title = 'Terminal',
        title_pos = 'left',
        row = math.floor(((vim.o.lines - width) / 2) - 1),
        col = math.floor((vim.o.columns - height) / 2),
        width = width,
        height = height,
        anchor = 'NW',
        style = 'minimal',
        border = 'single',
    })
    vim.cmd.term()
end)

-- Triggers highlighting of the copied characters when yanking text.
-- Stolen from kickstart.nvim!
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('TermOpen', {
    desc = 'Local default settings for new terminal buffers',
    group = vim.api.nvim_create_augroup('-term-buf-with-prefs', { clear = true }),
    callback = function()
        local set = vim.opt_local
        set.number = false
        set.relativenumber = false
        set.cursorline = false
        set.scrolloff = 0
        vim.cmd.startinsert()
    end,
})

vim.opt.signcolumn = 'yes'

vim.opt.swapfile = false

-- Use a single statusline for every split
vim.opt.laststatus = 3

-- Mode is already displayed in the custom statusline
vim.opt.showmode = false

-- Bootstrap Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup({ import = 'core/plugin' }, {
    change_detection = {
        notify = false,
    },
})
