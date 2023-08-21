-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- nvim-tree, use <leader>e to access
	{
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup()
	end,
	},
	-- github copilot
	{
	"github/copilot.vim",
	},
	-- autopairs, closes braces, quotes, etc
	{
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {} -- equivalent to setup({})
	},
	-- web dev icons
	{
	"nvim-tree/nvim-web-devicons",
	dependencies = {},
	},
	-- outline
	{
		'simrat39/symbols-outline.nvim',
		dependencies = {},
		config = function ()
			require("symbols-outline").setup({
			  highlight_hovered_item = true,
			  show_guides = true,
			  auto_preview = false,
			  position = 'right',
			  relative_width = true,
			  width = 25,
			  auto_close = false,
			  show_numbers = false,
			  show_relative_numbers = false,
			  show_symbol_details = true,
			  preview_bg_highlight = 'Pmenu',
			  autofold_depth = nil,
			  auto_unfold_hover = true,
			  fold_markers = { '', '' },
			  wrap = false,
			  keymaps = { -- These keymaps can be a string or a table for multiple keys
			    close = {"<Esc>", "q"},
			    goto_location = "<Cr>",
			    focus_location = "o",
			    hover_symbol = "<C-space>",
			    toggle_preview = "K",
			    rename_symbol = "r",
			    code_actions = "a",
			    fold = "h",
			    unfold = "l",
			    fold_all = "W",
			    unfold_all = "E",
			    fold_reset = "R",
			  },
			  lsp_blacklist = {},
			  symbol_blacklist = {},
			  symbols = {
			    File = { icon = "File", hl = "@text.uri" },
			    Module = { icon = "mod", hl = "@namespace" },
			    Namespace = { icon = "namespace", hl = "@namespace" },
			    Package = { icon = "PKG", hl = "@namespace" },
			    Class = { icon = "class", hl = "@type" },
			    Method = { icon = "ƒ", hl = "@method" },
			    Property = { icon = "prop", hl = "@method" },
			    Field = { icon = "field", hl = "@field" },
			    Constructor = { icon = "ctor", hl = "@constructor" },
			    Enum = { icon = "Enum", hl = "@type" },
			    Interface = { icon = "interface", hl = "@type" },
			    Function = { icon = "ƒ(x)", hl = "@function" },
			    Variable = { icon = "var", hl = "@constant" },
			    Constant = { icon = "const", hl = "@constant" },
			    String = { icon = "string", hl = "@string" },
			    Number = { icon = "num", hl = "@number" },
			    Boolean = { icon = "bool", hl = "@boolean" },
			    Array = { icon = "[x]", hl = "@constant" },
			    Object = { icon = "obj", hl = "@type" },
			    Key = { icon = "key", hl = "@type" },
			    Null = { icon = "NULL", hl = "@type" },
			    EnumMember = { icon = "Enum_member", hl = "@field" },
			    Struct = { icon = "struct", hl = "@type" },
			    Event = { icon = "event", hl = "@type" },
			    Operator = { icon = "operator", hl = "@operator" },
			    TypeParameter = { icon = "𝙏-param", hl = "@parameter" },
			    Component = { icon = "<COMP>", hl = "@function" },
			    Fragment = { icon = "</>", hl = "@constant" },
			  },
			 })
		end,
	},
}
