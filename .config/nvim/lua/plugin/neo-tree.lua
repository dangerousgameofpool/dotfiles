return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '<leader>e', '<CMD>Neotree reveal<CR>', desc = 'Open file tree' },
    },
    opts = {
        filesystem = {
            mappings = {
                ['\\'] = 'close_window',
            },
        },
    },
}
