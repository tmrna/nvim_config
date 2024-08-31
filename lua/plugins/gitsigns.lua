return {
	'lewis6991/gitsigns.nvim',
	opts = {
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = 'x' },
			topdelete = { text = 'Tx' },
			changedelete = { text = '~x' }
		},
		on_attach = function(bufnr)
			local signs = require('gitsigns')
			vim.keymap.set('n', '<leader>gp', signs.prev_hunk, { buffer = bufnr, desc = 'go to prev hunk' })
			vim.keymap.set('n', '<leader>gn', signs.next_hunk, { buffer = bufnr, desc = 'go to next hunk' })
			vim.keymap.set('n', '<leader>ph', signs.preview_hunk, { buffer = bufnr, desc = 'preview hunk' })
		end
	}
}
