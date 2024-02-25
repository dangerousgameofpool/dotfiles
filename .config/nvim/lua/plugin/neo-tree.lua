return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			icon = {
				folder_closed = ">",
				folder_open = "v",
				folder_empty = ">",
				-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
				-- then these will never be used.
				default = "*",
				highlight = "NeoTreeFileIcon",
			},
			close_if_last_window = true,
		})
		vim.keymap.set("n", "<Leader>tt", "<cmd>Neotree<cr>", { desc = "Toggle Neo-tree file explorer" })
	end,
}
