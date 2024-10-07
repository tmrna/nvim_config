-- yoinked from https://github.com/bcampolo/nvim-starter-kit/tree/java

-- JDTLS (Java LSP) configuration
local jdtls = require('jdtls')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.env.HOME .. '/jdtls-workspace/' .. project_name

-- Needed for debugging
local bundles = {
  vim.fn.glob(vim.env.HOME .. '/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar'),
}

-- Needed for running/debugging unit tests
vim.list_extend(bundles,
  vim.split(vim.fn.glob(vim.env.HOME .. "/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n"))

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. vim.env.HOME .. '/.local/share/nvim/mason/share/jdtls/lombok.jar',
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- Eclipse jdtls location
    '-jar', vim.env.HOME .. '/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar',
    '-configuration', vim.env.HOME .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
    '-data', workspace_dir
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'pom.xml', 'build.gradle' }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {
      home = '/usr/lib/jvm/java-17-openjdk-amd64',
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        -- The runtime name parameters need to match specific Java execution environments.  See https://github.com/tamago324/nlsp-settings.nvim/blob/2a52e793d4f293c0e1d61ee5794e3ff62bfbbb5d/schemas/_generated/jdtls.json#L317-L334
        runtimes = {
          {
            name = "JavaSE-11",
            path = "/usr/lib/jvm/java-11-openjdk-amd64",
          },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk-amd64",
          },
          {
            name = "JavaSE-19",
            path = "/usr/lib/jvm/java-19-openjdk-amd64",
          }
        }
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      signatureHelp = { enabled = true },
      format = {
        enabled = true,
        -- Formatting works by default, but you can refer to a specific file/URL if you choose
        -- settings = {
        --   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
        --   profile = "GoogleStyle",
        -- },
      },
    },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org"
      },
    },
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  -- Needed for auto-completion with method signatures and placeholders
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    -- References the bundles defined above to support Debugging and Unit Testing
    bundles = bundles
  },
}

-- Needed for debugging
config['on_attach'] = function(client, bufnr)
  jdtls.setup_dap({ hotcodereplace = 'auto' })
  require('jdtls.dap').setup_dap_main_class_configs()
end

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)

-- DAP general keymaps
vim.keymap.set("n", "<leader>tb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
  { desc = '[t]oggle [b]reakpoint' })
vim.keymap.set("n", "<leader>bpc",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
  { desc = 'add [b]reak [p]oint [c]ondition' })
vim.keymap.set("n", "<leader>bm",
  "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  { desc = 'add [b]reak [m]essage' })
vim.keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>",
  { desc = '[b]reakpoints [r]emove' })
vim.keymap.set("n", '<leader>bl', '<cmd>Telescope dap list_breakpoints<cr>',
  { desc = '[b]reakpoints [l]ist' })
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>",
  { desc = '[d]ap [c]ontinue' })
vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_into()<cr>",
  { desc = 'dap, step into' })
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_over()<cr>",
  { desc = 'dap step over' })
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>",
  { desc = 'dap step out' })
vim.keymap.set("n", '<leader>dd', function()
  require('dap').disconnect(); require('dapui').close();
end, { desc = 'dap disconnect' })
vim.keymap.set("n", '<leader>dt', function()
  require('dap').terminate(); require('dapui').close();
end, { desc = 'dap terminate' })
vim.keymap.set("n", "<leader>drt", "<cmd>lua require'dap'.repl.toggle()<cr>",
  { desc = 'dap repl toggle' })
vim.keymap.set("n", "<leader>drl", "<cmd>lua require'dap'.run_last()<cr>",
  { desc = 'dap run last' })
vim.keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end,
  { desc = 'dap inspect widget' })
vim.keymap.set("n", '<leader>dw',
  function()
    local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
  end, { desc = 'dap widgets' })
vim.keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>', { desc = 'dap frames' })
vim.keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>', { desc = 'dap help' })
vim.keymap.set("n", '<leader>de',
  function() require('telescope.builtin').diagnostics({ default_text = ":E:" }) end,
  { desc = 'dap explain diagnostic' })

-- testing keymaps
vim.keymap.set("n", '<leader>mio', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').organize_imports();
  end
end, { desc = '[m]anage [i]mports [o]rganize' })

vim.keymap.set("n", '<leader>mpu', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').update_projects_config();
  end
end, { desc = "[m]anaga [p]roject [u]pdate config" })

vim.keymap.set("n", '<leader>tc', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_class();
  end
end, { desc = "[t]est [c]lass" })

vim.keymap.set("n", '<leader>tm', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_nearest_method();
  end
end, { desc = '[t]est [m]ethod' })
