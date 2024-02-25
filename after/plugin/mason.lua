local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')

-- Setup Mason for language servers
mason.setup({})

local mason_handlers = {
    -- Any language server not listed here will be handled by the default
    lsp_zero.default_setup,

    --provide targeted overrides for specific servers.

    -- GO
    ["gopls"] = function()
        lspconfig.gopls.setup({
            cmd = { "gopls", "serve" },
            on_attach = function(client, bufnr)
                lsp_zero.async_autoformat(client, bufnr)
            end
        })
    end,

    --lua
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,

    -- typescript
    ["tsserver"] = function()
        lspconfig.tsserver.setup({
            filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
            cmd = { "typescript-language-server", "--stdio" },
            on_attach = function(client, bufnr)
                lsp_zero.async_autoformat(client, bufnr)
            end
        })
    end,

    -- tailwindcss
    ["tailwindcss"] = function()
        lspconfig.tailwindcss.setup({
            cmd = { "tailwindcss-language-server", "--stdio" },
            filetypes = { "html", "css", "scss",
                "javascript", "javascriptreact", "typescript",
                "typescriptreact", "svelte", "vue", "templ" },
            init_options = { userLanguages = { templ = "html" } },
            root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "tailwind.config.ts",
                "tailwind.config.tsx", "tailwind.config.json", ".git"),

            on_attach = function(client, bufnr)
                lsp_zero.async_autoformat(client, bufnr)
            end

        })
    end,

    -- svelte / sveltekit
    ["svelte"] = function()
        lspconfig.svelte.setup({
            cmd = { "svelteserver", "--stdio" },
            filetypes = { "svelte" },
            root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
            on_attach = function(client, bufnr)
                lsp_zero.async_autoformat(client, bufnr)
            end
        })
    end,

    -- eslint
    ["eslint"] = function()
        lspconfig.eslint.setup({
            single_file_support = false,
            cmd = { "vscode-eslint-language-server", "--stdio" },
            filetypes = {
                "javascript", "javascriptreact", "typescript",
                "typescriptreact", "svelte", "vue" },
            on_attach = function(client, bufnr)
                lsp_zero.async_autoformat(client, bufnr)
            end
        })
    end,

    -- html
    ["html"] = function()
        lspconfig.html.setup({
            filetypes = { "html", "templ" },
        })
    end,

    -- htmx
    ["htmx"] = function()
        lspconfig.htmx.setup {
            filetypes = { "html", "templ" },
        }
    end,

    -- templ (https://github.com/a-h/templ)
    ["templ"] = function()
        lspconfig.templ.setup({
            filetypes = { "templ" },
        })
    end

}

mason_lspconfig.setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
        -- Web stuff
        'tsserver', 'html', 'htmx', 'tailwindcss', 'svelte', 'eslint',
        -- Must have language servers
        'rust_analyzer', 'lua_ls', 'gopls', 'pylsp'
    },
    handlers = mason_handlers
})
