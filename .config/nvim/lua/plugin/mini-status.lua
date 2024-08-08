return {
    'echasnovski/mini.statusline',
    enabled = false,
    version = '*',
    config = function()
        require('mini.statusline').setup({
            set_vim_settings = false,
        })
    end,
}
