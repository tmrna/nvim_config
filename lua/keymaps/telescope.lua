return {
	vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
		{ desc = '[?] Find recently opened files' }),
	vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
		{ desc = '[ ] Find existing buffers' }),

	vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files,
		{ desc = 'Search [G]it [F]iles' }),
	vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' }),
	vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' }),
	vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
		{ desc = '[S]earch current [W]ord' }),
	vim.keymap.set('n', '<leader>sg', function()
		require('telescope.builtin').live_grep {
			find_command = {'rg', '--files', '--regexp'},
			prompt_title = "Regex search"
		}
	end, {desc = '[S]earch [G]rep with regex'})
}
