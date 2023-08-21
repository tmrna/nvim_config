return{
  -- next tab
  vim.keymap.set('n', '<leader>tn', ':tabNext<CR>', {desc = "move to [N]ext tab"}),
  -- previous tab
  vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', {desc = "move to [P]revious tab"}),
  -- create tab
  vim.keymap.set('n', '<leader>tc', ':tabnew<CR>', {desc = "[C]reate a new tab"}),
  -- list tabs 
  vim.keymap.set('n', '<leader>tl', ':tabs<CR>', {desc = "[L]ist tabs"}),
  -- close current tab
  vim.keymap.set('n', '<leader>td', ':tabclose<CR>', {desc = "[D]elete current tab"}),
  -- go to beginning tab
  vim.keymap.set('n', '<leader>tb', ':tabfirst<CR>', {desc = "go to first/[B]eginning tab"}),
  -- go to ending tab 
  vim.keymap.set('n', '<leader>te', ':tablast<CR>', {desc = "go to last/[E]nding tab"}),
}
