return {
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
	},

	-- keymaps
	vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', {noremap = true, desc = 'Open nvim tree'}),
	vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>', {noremap = true, desc = 'Open at current file in nvim tree'})
}
