return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
        vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file tree' })
        -- Focusing the file tree will automatuically open it if it's not already active
        vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFocus<cr>', { desc = 'Focus on file tree' })
    end,
    config = function()
        require('nvim-tree').setup()
    end,
}
