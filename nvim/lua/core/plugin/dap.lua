return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio',
            'theHamsta/nvim-dap-virtual-text',
        },
        config = function()
            local dap = require 'dap'
            local ui = require 'dapui'

            vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
            vim.keymap.set('n', '<leader>dc', dap.continue, {})
        end,
    },
}
