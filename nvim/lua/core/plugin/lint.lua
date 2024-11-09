return {
    'mfussenegger/nvim-lint',
    event = {
        'BufReadPre',
        'BufNewFile',
    },
    config = function()
        local lint = require 'lint'

        lint.linters_by_ft = {
            python = { 'pylint' },
        }

        for _, ftype in ipairs { 'javascript', 'typescript' } do
            lint.linters_by_ft[ftype] = { 'eslint_d' }
        end

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = vim.api.nvim_create_augroup('lint', { clear = true }),
            callback = function()
                lint.try_lint()
            end,
        })

        --  Also set a keymap to trigger it manually.
        vim.keymap.set('n', '<leader>l', function()
            lint.try_lint()
            vim.notify 'Linting triggered manually...'
        end, { desc = 'Trigger linting for current file' })
    end,
}
