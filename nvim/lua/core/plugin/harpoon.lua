return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function()
        local harpoon = require 'harpoon'
        local devicon = require 'nvim-web-devicons'

        harpoon:setup {
            default = {
                display = function(list_item)
                    return string.format('%s %s', (devicon.get_icon(list_item.value) or ''), list_item.value)
                end,
            },
        }

        vim.keymap.set('n', '<leader>a', function()
            harpoon:list():add()
            vim.notify(string.format('file %s added to harpoon list', vim.fn.expand '%:t'))
        end)

        vim.keymap.set('n', '<M-e>', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        for _, idx in ipairs { 1, 2, 3, 4, 5 } do
            vim.keymap.set('n', string.format('<leader>%d', idx), function()
                harpoon:list():select(idx)
            end)
        end

        vim.api.nvim_create_autocmd('Filetype', {
            group = vim.api.nvim_create_augroup('-harpoon-buf-prefs', { clear = true }),
            pattern = 'harpoon',
            callback = function()
                vim.cmd 'set cursorline'
            end,
        })

        local function constrain_cursor()
            local pos = vim.api.nvim_win_get_cursor(0)

            -- Don't restrict cursor movement if list entry is empty
            if not harpoon:list():get(pos[1]) then
                return
            end

            if pos[2] < 4 then
                vim.api.nvim_win_set_cursor(0, { pos[1], 4 })
            end
        end

        local function highlight_ftype()
            for i = 1, harpoon:list():length() do
                local ftype = vim.fn.fnamemodify(harpoon:list():get(i).value, '%:e')
                local _, hl = devicon.get_icon(ftype)
                vim.api.nvim_buf_add_highlight(0, 0, hl, i, 1, 4)
            end
        end

        vim.api.nvim_create_autocmd('Filetype', {
            group = '-harpoon-buf-prefs',
            pattern = 'harpoon',
            callback = function()
                local i = 0
                vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                    callback = function()
                        if vim.bo.filetype ~= 'harpoon' then
                            return
                        end
                        -- highlight_ftype() -- still working on this one
                        constrain_cursor()
                        i = i + 1
                        vim.notify(string.format('Autocmd has run %d times', i))
                    end,
                })
            end,
        })
    end,
}
