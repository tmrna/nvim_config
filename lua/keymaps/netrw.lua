return {
	-- keymaps
	vim.keymap.set('n', '<leader>e', ':Lexplore<CR>', {noremap = true, desc = 'Open nvim tree'}),
	vim.keymap.set('n', '<leader>nf', ':Lexplore %:p:h<CR>', {noremap = true, desc = 'Open at current file in nvim tree'}),
}
