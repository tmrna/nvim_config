return {
  -- spelling
  vim.api.nvim_set_keymap('v', '<leader>ss', 'z=', { desc = '[S]pelling [S]uggestion' }),
  vim.api.nvim_set_keymap('n', '<leader>ss', 'z=', { desc = '[S]pelling [S]uggestion' }),
  -- formatting
  vim.keymap.set('n', '<leader>F', ':Format<cr>', { desc = '[F]ormat current buffer' }),
  -- Telescope
  vim.api.nvim_set_keymap('n', '<leader>sb', ':Telescope git_branches<cr>', { desc = '[S]how git [B]ranches' }),
  vim.api.nvim_set_keymap('n', '<leader>gs', ':Telescope git_status<cr>', { desc = '[G]it [S]tatus' }),
  vim.api.nvim_set_keymap('n', '<leader>m', ':Telescope marks<cr>', { desc = 'show current [M]arks' })
}
