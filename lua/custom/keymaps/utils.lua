return {
  vim.api.nvim_set_keymap('v', '<leader>ss', 'z=', { desc = '[S]pelling [S]uggestion' }),
  vim.api.nvim_set_keymap('n', '<leader>ss', 'z=', { desc = '[S]pelling [S]uggestion' }),
  vim.keymap.set('n', '<leader>F', ':Format<cr>', { desc = '[F]ormat current buffer' })
}
