return {
	vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', {desc = '[G]it [C]ommit'}),
	vim.api.nvim_set_keymap('n', '<leader>gaa', ':Git add *<CR>', {desc = '[G]it [A]dd [A]ll'}),
	vim.api.nvim_set_keymap('n', '<leader>grp', ':Git push<CR>', {desc = '[G]it [R]emote [P]ush'}),
	vim.api.nvim_set_keymap('n', '<leader>gss', ':Git add *<CR>:Git stash<CR>', {desc = '[G]it [S]tash'}),
	vim.api.nvim_set_keymap('n', '<leader>gsa', ':Git stash apply 0<CR>', {desc = '[G]it [S]tash [A]pply'}),
	vim.api.nvim_set_keymap('n', '<leader>gsc', ':Git stash clear<CR>', {desc = '[G]it [S]tash [C]lear'}),
	vim.api.nvim_set_keymap('n', '<leader>gmt', ':Git mergetool<CR>', {desc = '[G]it [M]ergetool'})
}
