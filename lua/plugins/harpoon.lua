local harpoonConfig = function()
  local mark = require 'harpoon.mark'
  local ui = require 'harpoon.ui'

  vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Harpoon: Add file to menu' })
  vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'Harpoon: Toggle quick menu' })

  vim.keymap.set('n', '<C-h>', function()
    ui.nav_file(1)
  end)
  vim.keymap.set('n', '<C-j>', function()
    ui.nav_file(2)
  end)
  vim.keymap.set('n', '<C-k>', function()
    ui.nav_file(3)
  end)
  vim.keymap.set('n', '<C-l>', function()
    ui.nav_file(4)
  end)
end
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = harpoonConfig(),
}
