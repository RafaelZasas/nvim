local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with({
            filetypes = { "javascript", "typescript", "json", "yaml", "markdown", "html", "templ" },
        }),
        formatting.stylua,
        formatting.black,
        null_ls.builtins.completion.spell,
    },
})
