local gruvbox_dark = require "lualine.themes.gruvbox_dark"
return{
	{
             vim.o.background(gruvbox_dark), -- or "light" for light mode
             vim.cmd([[colorscheme gruvbox]])
	},
}
