return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local oil = require 'oil'

        CustomOilBar = function()
            local buf_dir = oil.get_current_dir(0)
            local file_num = vim.fn.system(string.format('ls -A %s | wc -l', buf_dir))
            local path = vim.fn.expand '%'
            path = path:gsub('oil://', '')
            return '  ' .. string.format('(%d files) ', file_num) .. vim.fn.fnamemodify(path, ':.')
        end

        oil.setup {
            columns = { 'icon' },
            keymaps = {
                ['<C-h>'] = false,
                ['<C-l>'] = false,
                ['<C-k>'] = false,
                ['<C-j>'] = false,
                ['<M-h>'] = 'actions.select_split',
            },
            win_options = {
                winbar = '%{v:lua.CustomOilBar()}',
            },
            view_options = {
                show_hidden = true,
            },
        }

        -- Open parent directory
        vim.keymap.set('n', '-', oil.open, { desc = 'Open parent directory in file explorer' })

        -- Open parent directory in floating window
        vim.keymap.set('n', '<leader>-', oil.toggle_float)
    end,
}
