-- determine os
local is_windows = package.config:sub(1,1)=="\\"

-- vim settings
-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- use sys clipboard
vim.o.clipboard = 'unnamedplus'

-- enable signcolumn for git integration
vim.wo.signcolumn = 'yes'

-- decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- spell language
vim.spelllang = 'en_us'

-- completion helper
vim.o.completeopt = 'menuone,noselect'

-- save undo history
vim.o.undofile = true

-- highlight yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- handling word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


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

local imports = {
	{ import = "core" },
	{ import = "plugins" },
	{ import = "keymaps" },
	{ import = "colorschemes" },
	{ import = "core" }
}

if not is_windows then
	imports[5].import = "lang_specific"
end

-- import modules for lazy to handle
require('lazy').setup(imports, {})

-- load fzf native
pcall(require('telescope').load_extension, 'fzf')

-- select colorscheme
vim.cmd [[colorscheme gruvbox]]
