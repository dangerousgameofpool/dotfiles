return {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    init = function()
        -- Just comment this out when you want to switch default themes.
        vim.cmd('colorscheme kanagawa')
    end,
    config = function()
        require('kanagawa').setup({
            compile = true,
            undercurl = true,
            commentStyle = { italic = false },
            functionStyle = { italic = false },
            keywordStyle = { italic = false },
            statementStyle = { italic = false },
            typeStyle = { italic = false },

            -- The following override disables the last bits of italicization that the above settings don't cover; in this case,
            -- built-in variables in languages like Python and Javascript. The Treesitter documentation has a full list of options
            -- at: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
            -- This should work for any colorschemes that don't allow you to fully disable italicization via config.
            overrides = function()
                return {
                    ['@variable.builtin'] = { italic = false },
                }
            end,
            -- Default settings leave the gutter background color as a lighter shade than
            -- the primary editor background. Set bg_gutter to none for them to match.
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = 'none',
                        },
                    },
                },
            },
        })
    end,
}
