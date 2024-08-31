-- Basic configs, leader, line numbers, etc
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.spelllang = 'en_us'

-- search settings with "/"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- use system clipboard
vim.o.clipboard = 'unnamedplus'

-- install lazy
local path_to_lazy = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(path_to_lazy) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		path_to_lazy
	}
end
vim.opt.rtp:prepend(path_to_lazy)

-- import modules for lazy to handle
require('lazy').setup({
	{import = "core"},
	{import = "plugins"},
	{import = "keymaps"},
	{import = "colorschemes"}
}, {})

-- load fzf native 
pcall(require('telescope').load_extension, 'fzf')
