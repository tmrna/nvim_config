local nvim_version = vim.version()
local use_legacy = nvim_version.major == 0 and nvim_version.minor < 10

local config = {
	"neovim/nvim-lspconfig",

	dependencies = {
		{
			"williamboman/mason.nvim",
			config = true,
		},

		{
			"williamboman/mason-lspconfig.nvim",
		},

		{
			"j-hui/fidget.nvim",
			opts = {},
		},

		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
		},
	},

	config = function()
		-- lua tooling
		if use_legacy then
			require("neodev").setup()
		else
			require("lazydev").setup()
		end

		require("luasnip").setup()

		-- lsp attach keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local bufnr = event.buf

				local nmap = function(keys, func, desc)
					vim.keymap.set("n", keys, func, {
						buffer = bufnr,
						desc = "LSP: " .. desc,
					})
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

				nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

				nmap(
					"<leader>sds",
					require("telescope.builtin").lsp_document_symbols,
					"[S]earch [D]ocument [S]ymbols"
				)

				nmap(
					"<leader>ws",
					require("telescope.builtin").lsp_dynamic_workspace_symbols,
					"[W]orkspace [S]ymbols"
				)

				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

				vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
					vim.lsp.buf.format()
				end, { desc = "Format current buffer" })

				nmap("<leader>F", "<cmd>Format<CR>", "[F]ormat buffer")
			end,
		})

		-- completion capabilities
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- servers
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
		}

		-- mason
		require("mason").setup()

		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		-- modern nvim 0.11+ lsp setup
		for server_name, server_config in pairs(servers) do
			server_config.capabilities = capabilities

			vim.lsp.config(server_name, server_config)
			vim.lsp.enable(server_name)
		end

		-- cmp
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),

				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),

				["<Tab>"] = cmp.mapping.select_next_item(),
			}),

			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
		})

		-- global diagnostics
		vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, {
			desc = "Show diagnostics",
		})

		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
			desc = "Previous diagnostic",
		})

		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
			desc = "Next diagnostic",
		})
	end,
}

if use_legacy then
	table.insert(config.dependencies, {
		"folke/neodev.nvim",
	})
else
	table.insert(config.dependencies, {
		"folke/lazydev.nvim",
	})
end

return config
