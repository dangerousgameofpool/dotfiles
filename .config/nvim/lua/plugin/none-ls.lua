return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
                -- lua
				null_ls.builtins.formatting.stylua,
                -- go
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.golines,
                -- javascript/typescript
				null_ls.builtins.formatting.eslint,
                -- python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
