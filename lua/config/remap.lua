-- Description: This file contains all of the remaps that I use in my neovim configuration

-- Set <space> as the leader key
vim.g.mapleader = ' '

-- <space>pv to open netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Allows you to move lines up and down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- supposedly the greatest remap ever. credit: ThePrimeagen
-- Allows you to paste without copying the text you're pasting over
vim.keymap.set('x', '<leader>p', '"_dP')

-- next greatest remap ever, apparently.
-- Allows you to copy buffer to clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+y')

-- Allows you to view diagnostics in a floating window
vim.keymap.set('n', '<leader>dn', ':lua vim.diagnostic.open_float(0, {focus=false})<CR>')
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Keymap for Vim fugitive (git stuff)
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
