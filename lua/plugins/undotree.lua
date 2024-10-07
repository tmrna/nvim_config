return {
	"mbbill/undotree",
	vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = 'Toggle [U]ndotree' }),

	config = function()
		-- setup undo tree to be on the right
		vim.g.undotree_WindowLayout = 3
		-- set window width for undo tree
		vim.g.undotree_SplitWidth = 40
	end
}
