return {
    'stevearc/conform.nvim',
    branch = 'nvim-0.9',
    event = {
        'BufReadPre',
        'BufNewFile',
    },
    config = function()
        local formatters_by_ft = {
            lua = { 'stylua' },

            python = {
                'isort',
                'yapf', -- Configure in .style.yapf
            },

            go = {
                'gofmt',
                'goimports',
                'golines',
            },

            sql = {
                'sleek',
            },

            c = { 'clang-format' },
            rust = { 'rustfmt' },
            ocaml = { 'ocamlformat' },
            latex = { 'latex' },
            php = { 'pretty-php' },
        }

        -- Apply prettier formatting to js-ecosystem filetypes
        for _, ftype in ipairs { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'astro', 'react' } do
            formatters_by_ft[ftype] = { 'prettierd', 'prettier', stop_after_first = true }
        end

        local conform = require 'conform'

        conform.setup {
            formatters_by_ft = formatters_by_ft,

            notify_on_error = false,
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
        }

        vim.keymap.set('n', '<leader>cf', function()
            conform.format { async = true, lsp_fallback = true }
            vim.notify 'Conform triggered manually...'
        end, { desc = 'Apply formatting to current buffer' })
    end,
}
