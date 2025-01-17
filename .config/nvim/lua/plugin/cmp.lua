return {
    {
        'hrsh7th/cmp-nvim-lsp',
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        -- event = "InsertEnter",
        config = function()
            local cmp = require('cmp')
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                -- Enable luasnip to handle snippet expansion for nvim-cmp
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    -- Enable these for a fancy bordered completion window.
                    -- NO THANKS THOUGH
                    -- NOT FOR ME
                    -- completion = cmp.config.window.border(),
                    -- documentation = cmp.config.window.bordered(),
                },
                experimental = {
                    ghost_text = true,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-y>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }, {
                        { 'i', 'c' },
                    }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                }, {
                    { name = 'buffer' },
                }),
            })
        end,
    },
}
