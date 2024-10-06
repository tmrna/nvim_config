return {
	vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, {desc = 'Floating msg diagnostic'}),
	vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, {desc = 'Go to next diagnostic'}),
	vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, {desc = 'Go to previous diagnostic'}),
	vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {desc = 'Get diagnostic list'}),
	vim.keymap.set('n', '<leader>ds', require('telescope.builtin').diagnostics, { desc = 'diagnostics search' })
}
