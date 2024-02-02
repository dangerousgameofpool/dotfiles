return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
             require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
             require("mason-lspconfig").setup({
                ensure_installed = {
                    "gopls", -- go
                    "pyright", -- python
                    "lua_ls", -- lua
                    "tsserver" -- javascript+typescript
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            lspconfig.pyright.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities
            })

            lspconfig.eslint.setup({
                capabilities = capabilities
            })
        end
    }
}

