return {
    'stevearc/oil.nvim',
    event = 'VimEnter',
    init = function()
        vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory in file explorer' })
        vim.keymap.set('n', '<leader>-', require('oil').toggle_float, { desc = ' Open parent directory in floating window' })
    end,
    opts = {
        -- default_file_explorer = true,
        columns = {
            -- Don't try to add 'name' to this table to move the filename.
            -- The plugin will throw an error and refuse to open.
            'icon',
        },
        skip_confirm_for_simple_edits = true,
        constrain_cursor = 'name', -- Keep the cursor from moving towards (and editing) file icons, sizes, etc.
        view_options = {
            show_hidden = true,
        },
    },
}
