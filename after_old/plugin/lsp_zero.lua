local lsp_zero = require("lsp-zero")

-- Fix Undefined global 'vim'
-- lsp.nvim_workspace()

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false, -- force lsp_zero bindings
    })

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "<leader>gn", function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "<leader>gp", function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
    end, opts)

    -- format on save based on current file ls
    --lsp_zero.buffer_autoformat()
end)

lsp_zero.set_sign_icons({
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "»",
})

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["gopls"] = { "go", "gomod", "gowork", "gotmpl" },
        ["templ"] = { "templ" },
        ["lua_ls"] = { "lua" },
        ["typescript"] = { "typescript", "typescriptreact", "typescript.tsx" },
        ["tailwindcss"] = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
            "vue",
            "templ",
        },
    },
})

lsp_zero.setup()
