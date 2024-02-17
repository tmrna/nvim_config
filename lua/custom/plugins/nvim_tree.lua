return {
	-- nvim-tree, use <leader>e to access
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
        git = {
          enable = true,
          ignore = false,
          timeout = 500
        }
      })
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		dependencies = {},
	}
}
