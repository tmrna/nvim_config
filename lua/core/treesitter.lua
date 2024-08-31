return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects'
	},
	build = ':TSUpdate',
	opt = {
		defaults = {
			mappings = {
				i = {
					['<c-u>'] = false,
					['<c-d>'] = false
				}
			}
		}
	}
}
