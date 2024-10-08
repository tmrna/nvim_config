return {
	'f-person/git-blame.nvim',
	vim.api.nvim_set_keymap('n', '<leader>gtb', ':GitBlameToggle<cr>', { desc = '[G]it [T]oggle [B]lame' }),
	vim.api.nvim_set_keymap('n', '<leader>goc', ':GitBlameOpenCommitURL<cr>',
		{ desc = '[G]it blame [O]pen [C]ommit URL' }),
	vim.api.nvim_set_keymap('n', '<leader>gof', ':GitBlameOpenFileURL<cr>',
		{ desc = '[G]it blame [O]pen [F]ile URL' })
}
