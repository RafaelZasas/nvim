local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            -- ignore virtual environments and package managers
            'package-lock.json', 'node_modules/', 'venv/',
            -- ignore firebase emulator data
            'emulators-data/', 'firebase-data/',
            -- ignore build directories
            'build/', 'out/', 'target/', 'dist/', 'bin/',
            -- ignore images
            'png', 'jpg', 'jpeg', 'gif', 'ico', 'webp',
        },
        prompt_prefix = ' 🔍 ',
    },
    extensions = {
        file_browser = {
            -- disables netrw and uses telescope-file-browser instead
            hijack_netrw = true,
        }
    }
})
