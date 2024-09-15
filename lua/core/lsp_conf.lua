return {

	-- packages
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = true
		},
		{
			"williamboman/mason-lspconfig.nvim",
		},
		{
			-- switching to lazydev, neodev is EOL
			"folke/lazydev.nvim",
		},
		{
			-- lsp progress indicator
			"j-hui/fidget.nvim",
			tag = "legacy",
			opts = {}
		},
		{
			'hrsh7th/nvim-cmp',
			dependencies = {
				'hrsh7th/cmp-nvim-lsp',
			}
		}
	},

	config = function()
		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				if desc then
					desc = 'LSP: ' .. desc
				end
				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
			end

			nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
			nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

			nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
			nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
			nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
			nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
			nmap('<leader>sds', require('telescope.builtin').lsp_document_symbols, 'search document symbols')
			nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
				'[W]orkspace [S]ymbols')

			nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

			vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
				vim.lsp.buf.format()
			end
			, { desc = 'format the current buffer' })
			nmap('<leader>f', vim.cmd.Format, 'format curr buff')
		end


		-- setup lazydev
		require('lazydev').setup()

		-- setup lsp capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		-- define servers that should be installed
		local servers = {
			lua_ls = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false }
			}
		}


		-- setup mason
		local mason_lspconfig = require('mason-lspconfig')

		mason_lspconfig.setup { ensure_installed = vim.tbl_keys(servers) }

		mason_lspconfig.setup_handlers {
			function(server_name)
				if server_name ~= 'jdtls' then
					require('lspconfig')[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name]
					}
					return
				end

				local jdtls = require('jdtls')
				jdtls.start_or_attach({
					cmd = {'jdtls'},
					on_attach = on_attach
				})
			end
		}

		-- configure cmp
		local cmp = require('cmp')
		cmp.setup {
			mapping = cmp.mapping.preset.insert {
				['<c-j>'] = cmp.mapping.select_next_item(),
				["<c-k>"] = cmp.mapping.select_prev_item(),
				['<CR>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true
				},
			},
			sources = {
				{ name = 'nvim_lsp' }
			}
		}
	end,

	opts = {},

	-- basic keymaps
	vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
}
