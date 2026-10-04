return {
	vim.keymap.set('n', '<leader>tn', ':tabNext<cr>', {desc='[T]ab [N]ext'}),
	vim.keymap.set('n', '<leader>tp', ':tabprevious<cr>', {desc='[T]ab [P]revious'}),
	vim.keymap.set('n', '<leader>td', ':tabclose<cr>', {desc = '[T]ab [D]elete'}),
	vim.keymap.set('n', '<leader>tt', ':tabnew<cr>:terminal<cr>', {desc='[T]ab [T]erminal'}),
	vim.keymap.set('t', '<esc>', '<C-\\><C-n>', {desc = 'Escape terminal mode'})
}
