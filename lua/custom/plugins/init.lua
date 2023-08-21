-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
require("custom.keymaps")
require("custom.plugins.outline")
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
	-- github copilot
	{
	"github/copilot.vim",
	},
	-- autopairs, closes braces, quotes, etc
	{
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {} -- equivalent to setup({})
	},
	-- web dev icons
	{
	"nvim-tree/nvim-web-devicons",
	dependencies = {},
	},
}
