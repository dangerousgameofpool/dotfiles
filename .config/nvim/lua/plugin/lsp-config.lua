return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"pyright",
					"lua_ls",
					"eslint",
					"tsserver",
					"tailwindcss",
					"rust_analyzer",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				"gopls",
				"pyright",
				"lua_ls",
				"eslint",
				"tsserver",
				"tailwindcss",
				"rust_analyzer",
			}

			for _, lsp in ipairs(servers) do
				require("lspconfig")[lsp].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
}
