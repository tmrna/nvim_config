-- yoinked from https://github.com/bcampolo/nvim-starter-kit/tree/java

return {
	vim.keymap.set("n", "<leader>tb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
		{ desc = '[t]oggle [b]reakpoint' }),
	vim.keymap.set("n", "<leader>bpc",
		"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
		{ desc = 'add [b]reak [p]oint [c]ondition' }),
	vim.keymap.set("n", "<leader>bm",
		"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
		{ desc = 'add [b]reak [m]essage' }),
	vim.keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>",
		{ desc = '[b]reakpoints [r]emove' }),
	vim.keymap.set("n", '<leader>bl', '<cmd>Telescope dap list_breakpoints<cr>', { desc = '[b]reakpoints [l]ist' }),
	vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = '[d]ap [c]ontinue' }),
	vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_into()<cr>", { desc = 'dap, step into' }),
	vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_over()<cr>", { desc = 'dap step over' }),
	vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = 'dap step out' }),
	vim.keymap.set("n", '<leader>dd', function()
		require('dap').disconnect(); require('dapui').close();
	end, { desc = 'dap disconnect' }),
	vim.keymap.set("n", '<leader>dt', function()
		require('dap').terminate(); require('dapui').close();
	end, { desc = 'dap terminate' }),
	vim.keymap.set("n", "<leader>drt", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = 'dap repl toggle' }),
	vim.keymap.set("n", "<leader>drl", "<cmd>lua require'dap'.run_last()<cr>", { desc = 'dap run last' }),
	vim.keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end,
		{ desc = 'dap inspect widget' }),
	vim.keymap.set("n", '<leader>dw',
		function()
			local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
		end, { desc = 'dap widgets' }),
	vim.keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>', { desc = 'dap frames' }),
	vim.keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>', { desc = 'dap help' }),
	vim.keymap.set("n", '<leader>de',
		function() require('telescope.builtin').diagnostics({ default_text = ":E:" }) end,
		{ desc = 'dap explain diagnostic' }),
}
