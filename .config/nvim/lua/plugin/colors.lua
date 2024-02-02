return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		config = function()
			require("kanagawa").setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
				transparent = false,
				theme = "wave",
				colors = {
					theme = {
						wave = {
							ui = {
								bg_gutter = "#1F1F28",
							},
						},
					},
				},
			})
			vim.cmd("colorscheme kanagawa")
		end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},
			})
			-- vim.cmd("colorscheme rose-pine")
		end,
	},
}
