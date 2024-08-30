return {
  vim.keymap.set('n', '<leader>rtc', function()
    if vim.bo.filetype == "java" then
      require("jdtls").test_class()
    end
  end,
    {desc = "java [R]un [T]est [C]lass"}
  ),

  vim.keymap.set("n", "<leader>rtm", function()
    if vim.bo.filetype == "java" then
      require("jdtls").test_nearest_method()
    end
  end)
}
