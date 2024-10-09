local telescope_builtin = require('telescope.builtin')
local telescope_actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
	pickers = {
		git_branches = {
			prompt_title = 'Switch Branch',
			mappings = {
				i = {
					["<CR>"] = telescope_actions.git_switch_branch
				},
				n = {
					["<CR>"] = telescope_actions.git_switch_branch,
					['d'] = telescope_actions.git_delete_branch,
					['<leader>cb'] = telescope_actions.git_create_branch,
					['<leader>mb'] = telescope_actions.git_merge_branch
				}
			}
		}
	}
}

local tbl = {
	vim.keymap.set('n', '<leader>?', telescope_builtin.oldfiles,
		{ desc = '[?] Find recently opened files' }),
	vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers,
		{ desc = '[ ] Find existing buffers' }),

	vim.keymap.set('n', '<leader>gf', telescope_builtin.git_files,
		{ desc = 'Search [G]it [F]iles' }),
	vim.keymap.set('n', '<leader>sb', telescope_builtin.git_branches, { desc = '[S]witch [B]ranch' }),
	vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files, { desc = '[S]earch [F]iles' }),
	vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' }),
	vim.keymap.set('n', '<leader>sw', telescope_builtin.grep_string,
		{ desc = '[S]earch current [W]ord' }),
	vim.keymap.set('n', '<leader>sg', function()
		telescope_builtin.live_grep {
			find_command = { 'rg', '--files', '--regexp' },
			prompt_title = "Regex search"
		}
	end, { desc = '[S]earch [G]rep with regex' })
}

return tbl
