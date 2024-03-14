local mason = require 'mason'
local mason_lspconfig = require 'mason-lspconfig'
local lsp_zero = require 'lsp-zero'
local lspconfig = require 'lspconfig'

local on_attach = function(client, bufnr)
  lsp_zero.async_autoformat(client, bufnr)
end

require('lspconfig.ui.windows').default_options.border = 'rounded'

-- Setup Mason for language servers
mason.setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
    border = 'rounded',
  },
}

local mason_handlers = {
  -- Any language server not listed here will be handled by the default
  lsp_zero.default_setup,

  --provide targeted overrides for specific servers.

  -- GO
  ['gopls'] = function()
    lspconfig.gopls.setup {
      cmd = { 'gopls' },
      filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
      single_file_support = true,
    }
  end,

  --lua
  ['lua_ls'] = function()
    lspconfig.lua_ls.setup {
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            -- Tells lua_ls where to find all the Lua files that you have loaded
            -- for your neovim configuration.
            library = {
              '${3rd}/luv/library',
              unpack(vim.api.nvim_get_runtime_file('', true)),
            },
            -- If lua_ls is really slow on your computer, you can try this instead:
            -- library = { vim.env.VIMRUNTIME },
          },
          completion = {
            callSnippet = 'Replace',
          },
          -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          -- diagnostics = { disable = { 'missing-fields' } },
        },
      },
    }
  end,

  -- typescript
  ['tsserver'] = function()
    lspconfig.tsserver.setup {
      filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
      cmd = { 'typescript-language-server', '--stdio' },
      on_attach = on_attach,
    }
  end,

  -- tailwindcss
  ['tailwindcss'] = function()
    lspconfig.tailwindcss.setup {
      cmd = { 'tailwindcss-language-server', '--stdio' },
      filetypes = {
        'html',
        'css',
        'scss',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'svelte',
        'vue',
        'templ',
      },
      init_options = { userLanguages = { templ = 'html' } },
      root_dir = lspconfig.util.root_pattern(
        'tailwind.config.js',
        'tailwind.config.cjs',
        'tailwind.config.ts',
        'tailwind.config.tsx',
        'tailwind.config.json',
        '.git'
      ),
      settings = {
        tailwindCSS = {
          classAttributes = { 'class', 'className', 'class:list', 'classList', 'ngClass' },
          lint = {
            cssConflict = 'warning',
            invalidApply = 'error',
            invalidConfigPath = 'error',
            invalidScreen = 'error',
            invalidTailwindDirective = 'error',
            invalidVariant = 'error',
            recommendedVariantOrder = 'warning',
          },
          validate = true,
        },
      },
      on_attach = on_attach,
    }
  end,

  -- svelte / sveltekit
  ['svelte'] = function()
    lspconfig.svelte.setup {
      cmd = { 'svelteserver', '--stdio' },
      filetypes = { 'svelte' },
      root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', '.git'),
      on_attach = on_attach,
    }
  end,

  -- eslint
  ['eslint'] = function()
    lspconfig.eslint.setup {
      single_file_support = false,
      cmd = { 'vscode-eslint-language-server', '--stdio' },
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'svelte',
        'vue',
      },
      on_attach = on_attach,
    }
  end,

  -- html
  ['html'] = function()
    lspconfig.html.setup {
      filetypes = { 'html', 'templ' },
      init_options = {
        configurationSection = { 'html', 'css', 'javascript' },
        embeddedLanguages = {
          css = true,
          javascript = true,
        },
        provideFormatter = true,
      },
    }
  end,

  -- htmx
  ['htmx'] = function()
    lspconfig.htmx.setup {
      filetypes = { 'html', 'templ' },
    }
  end,
}

local custom_format = function()
  if vim.bo.filetype == 'templ' then
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = 'templ fmt ' .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
      on_exit = function()
        -- Reload the buffer only if it's still the current buffer
        if vim.api.nvim_get_current_buf() == bufnr then
          vim.cmd 'e!'
        end
      end,
    })
  else
    vim.lsp.buf.format()
  end
end

lspconfig.templ.setup {
  filetypes = { 'templ' },
  cmd = { 'templ', 'lsp' },
}

vim.api.nvim_create_autocmd({ 'BufWritePre' }, { pattern = { '*.templ' }, callback = custom_format })

vim.filetype.add { extension = { templ = 'templ' } }

mason_lspconfig.setup {
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
    -- Web stuff
    'tsserver',
    'html',
    'htmx',
    'tailwindcss',
    'svelte',
    'eslint',
    -- Must have language servers
    'rust_analyzer',
    'lua_ls',
    'gopls',
    'pylsp',
  },
  handlers = mason_handlers,
}
