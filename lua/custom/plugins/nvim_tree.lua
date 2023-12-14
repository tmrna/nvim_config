return {
	-- nvim-tree, use <leader>e to access
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup()
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		dependencies = {},
	}
}
