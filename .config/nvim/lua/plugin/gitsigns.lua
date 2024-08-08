return {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    init = function()
        vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', {})
    end,
    config = function()
        require('gitsigns').setup {}
    end,
}
