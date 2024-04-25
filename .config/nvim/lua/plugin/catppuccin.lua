return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
        -- Just comment this out when you want to switch default themes.
        vim.cmd('colorscheme catppuccin')
    end,
    config = function()
        require('catppuccin').setup({
            flavour = 'mocha',
            no_italic = true,
        })
    end,
}
