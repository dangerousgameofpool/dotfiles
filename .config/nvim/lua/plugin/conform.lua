return {
    'stevearc/conform.nvim',
    event = {
        'BufReadPre',
        'BufNewFile',
    },
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                python = {
                    'isort',
                    'black',
                },
                go = {
                    'gofmt',
                    'goimports',
                    'golines',
                },
                -- Enclosing options in two sets of curly braces will use ONLY the first available formatter in that table.
                -- Here, for Javascript, we're preferring the more performant prettierd, but will fallback to prettier if the former is not available.
                javascript = { { 'prettierd', 'prettier' } },
                typescript = { { 'prettierd', 'prettier' } },
                javascriptreact = { { 'prettierd', 'prettier' } },
                typescriptreact = { { 'prettierd', 'prettier' } },
                json = { { 'prettierd', 'prettier' } },
                vue = { { 'prettierd', 'prettier' } },
                svelte = { { 'prettierd', 'prettier' } },
                c = { 'clang-format' },
                rust = { 'rustfmt' },
                -- We are entering the ocaml zone
                ocaml = { 'ocamlformat' },
                latex = { 'latex' },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
        })
    end,
}
