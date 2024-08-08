return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        init = function()
            vim.keymap.set('n', '<leader>ms', '<cmd>Mason<cr>', { desc = 'Open Mason menu' })
        end,
        config = function()
            require('mason').setup({})
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'gopls',
                    'pyright',
                    'lua_ls',
                    'texlab',
                    'tsserver',
                    'rust_analyzer',
                },
            })
        end,
        {
            'neovim/nvim-lspconfig',
            lazy = false,
            init = function()
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            end,
            config = function()
                local capabilities = require('cmp_nvim_lsp').default_capabilities()
                local on_attach
                local servers = {
                    'gopls',
                    'pyright',
                    'lua_ls',
                    'texlab',
                    'tsserver',
                    'rust_analyzer',
                    'clangd',
                    'ocamllsp',
                    'volar',
                }

                for _, lsp in ipairs(servers) do
                    require('lspconfig')[lsp].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end
            end,
        },
    },
}
