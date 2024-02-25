vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- supposedly the greatest remap ever. credit: ThePrimeagen
-- Allows you to paste without copying the text you're pasting over
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever, apparently.
-- Allows you to copy buffer to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

-- Allows you to view diagnostics in a floating window
vim.keymap.set("n", "<leader>dn", ":lua vim.diagnostic.open_float(0, {focus=false})<CR>")
