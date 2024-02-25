return {
	"nvimtools/none-ls.nvim",
	-- event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({

			-- Automatically format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,

			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Go
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.golines,

				-- JavaScript, TypeScript, etc.
				null_ls.builtins.formatting.prettierd,

				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

				-- Rust
				null_ls.builtins.formatting.rustfmt,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
