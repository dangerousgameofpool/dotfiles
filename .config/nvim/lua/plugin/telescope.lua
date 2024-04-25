return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    -- Telescope documentation recommends setting 'tag' to '0.1.x', but Lazy throws an error.
    -- tag = "0.1.x",
    dependencies = {
        'nvim-lua/plenary.nvim',

        -- telescope plugins
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            event = 'VeryLazy',
            build = 'make',
        },
        {
            'debugloop/telescope-undo.nvim',
            event = 'VeryLazy',
        },
    },

    opts = {
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- overried the file sorter
                case_mode = 'ignore_case', -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
            undo = {
                -- use_delta = true,
            },
        },
    },

    config = function(_, opts)
        require('telescope').setup(opts)
        local builtin = require('telescope.builtin')
        require('telescope').load_extension('undo')
        require('telescope').load_extension('fzf')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep over project' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Search LSP diagnostics' })
        vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<cr>', { desc = 'undo history with Telescope' })
    end,
}
