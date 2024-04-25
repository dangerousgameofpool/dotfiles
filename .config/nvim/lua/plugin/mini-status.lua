return {
    'echasnovski/mini.statusline',
    version = '*',
    config = function()
        require('mini.statusline').setup({
            set_vim_settings = false,
        })
    end,
}
