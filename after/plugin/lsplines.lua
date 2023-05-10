
require("lsp_lines").setup()

vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = {only_cuur_line = true, highlight_whole_line = false},
})


