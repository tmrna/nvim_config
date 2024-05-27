return {
  vim.keymap.set('n', '<leader>gc', ':Git commit<cr>', { desc = '[G]it [C]ommit' }),
  vim.keymap.set('n', '<leader>ga', ':Git add *<cr>', { desc = '[G]it [Add] *'})
}
