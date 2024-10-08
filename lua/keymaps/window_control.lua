return {
	-- open vertical window
	vim.api.nvim_set_keymap('n', '<leader>v', '<c-w>v', { desc = "open vertical window" }),
	-- open horizontal window
	vim.api.nvim_set_keymap('n', '<leader>-', '<c-w>s', { desc = "open horizontal window" }),
	-- jump to left window
	vim.api.nvim_set_keymap('n', '<leader>h', '<c-w>h', { desc = "jump to left window" }),
	-- jump to right window
	vim.api.nvim_set_keymap('n', '<leader>l', '<c-w>l', { desc = "jump to right window" }),
	-- jump to upper window
	vim.api.nvim_set_keymap('n', '<leader>k', '<c-w>k', { desc = "jump to upper window" }),
	-- jump to lower window
	vim.api.nvim_set_keymap('n', '<leader>j', '<c-w>j', { desc = "jump to lower window" }),
}
