-- yoinked from https://github.com/bcampolo/nvim-starter-kit/tree/java

return {
  vim.keymap.set("n", '<leader>mio', function()
    if vim.bo.filetype == 'java' then
      require('jdtls').organize_imports();
    end
  end, {desc = '[m]anage [i]mports [o]rganize'}),

  vim.keymap.set("n", '<leader>mpu', function()
    if vim.bo.filetype == 'java' then
      require('jdtls').update_projects_config();
    end
  end, {desc = "[m]anaga [p]roject [u]pdate config"}),

  vim.keymap.set("n", '<leader>tc', function()
    if vim.bo.filetype == 'java' then
      require('jdtls').test_class();
    end
  end, {desc = "[t]est [c]lass"}),

  vim.keymap.set("n", '<leader>tm', function()
    if vim.bo.filetype == 'java' then
      require('jdtls').test_nearest_method();
    end
  end, {desc = '[t]est [m]ethod'})
}
