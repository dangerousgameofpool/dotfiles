return {
    {
        'L3MON4D3/LuaSnip',
        config = function()
            for _, ftype in ipairs(vim.api.nvim_get_runtime_file('lua/core/snippet/*.lua', true)) do
                loadfile(ftype)()
            end

            -- local ls = require 'luasnip'
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
        priority = 100,
        config = function()
            local cmp = require 'cmp'
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup {
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

                mapping = cmp.mapping.preset.insert {
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
                },

                sources = cmp.config.sources {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'emoji' },
                },
            }

            cmp.setup.filetype({ 'sql' }, {
                sources = {
                    { name = 'vim-dadbod-completion' },
                },
            })
        end,
    },
}
