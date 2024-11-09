local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values

local headings = function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = 'MD Headings',
        finder = finders.new_table {
            -- results =
        },
    })
end
