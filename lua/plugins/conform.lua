local M = { -- Autoformat
  'stevearc/conform.nvim',
}

M.config = function()
  local conform = require 'conform'

  conform.setup {
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
      python = { 'ruff', 'flake8', 'black', stop_after_first = true },
      go = { 'goimports', 'gofmt', stop_after_first = true },
      templ = { 'templ' },
      yaml = { 'yaml' },
    },

    notify_on_error = true,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    format_after_save = {
      lsp_fallback = true,
    },
    formatters = {
      prettierd = {
        cwd = require('conform.util').root_file { '.prettierrc', '.prettierrc.json', '.prettierrc.js' },
        require_cwd = true,
      },
      prettier = {
        cwd = require('conform.util').root_file { '.prettierrc', '.prettierrc.json', '.prettierrc.js' },
        require_cwd = true,
      },
    },
  }

  vim.keymap.set('n', '<leader>cf', function()
    conform.format { lsp_fallback = true }
  end, { desc = 'Format with Conform' })

  -- vim.api.nvim_create_autocmd('BufWritePre', {
  --   pattern = { '*' },
  --   callback = function(args)
  --     require('conform').format { bufnr = args.buf, lsp_fallback = true }
  --   end,
  -- })
end

return M
