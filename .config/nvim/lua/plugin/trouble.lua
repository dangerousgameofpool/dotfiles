return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup({
            icons = false,
            fold_open = "v",
            fold_closed = ">",
            indent_lines =  false,
            signs = {
                error = "E",
                warning = "W",
                hint = "H",
                information = "i"
            },
            use_diagnostic_signs = false,
        })
    end
}
