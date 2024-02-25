return {
	"catppuccin/nvim",
	name = "catppuccin-colors",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			no_italic = true,
			integrations = {
				neotree = true,
				cmp = true,
				dap = true,
				gitsigns = true,
				lsp_trouble = true, -- trouble.nvim
				native_lsp = { -- nvim-lspconfig
					enabled = true,
				},
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
