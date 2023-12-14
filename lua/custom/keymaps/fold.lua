return {
  vim.keymap.set('v', '<leader>f', ':fold<CR>', { desc = '[F]old current hightlight' }),
  vim.keymap.set('n', '<leader>fo', ':foldopen<CR>', { desc = '[F]old [O]pen' }),
  vim.keymap.set('n', '<leader>fc', ':foldclose<CR>', { desc = '[F]old [C]lose' }),
  vim.keymap.set('n', '<leader>fmi', ':set foldmethod=indent<CR>zR', { desc = 'set [F]old [M]ethod to [I]ndent' }),
  vim.keymap.set('n', '<leader>fmm', ':set foldmethod=manual<CR>zR', { desc = 'set [F]old [M]ethod to [M]anual' }),
  vim.keymap.set('n', '<leader>fa', 'zM', { desc = '[F]old [A]ll' }),
  vim.keymap.set('n', '<leader>ft', 'zA', { desc = '[F]old [T]oggle' }),
}
