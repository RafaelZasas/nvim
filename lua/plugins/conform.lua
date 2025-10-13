-- Autoformat
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>df',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[D]ocument [F]ormat buffer',
    },
  },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
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
      yaml = { 'yaml' },
    },
    notify_on_error = true,
    -- Set default options
    default_format_opts = {
      lsp_format = 'fallback',
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500 },

    -- formatters = {
    --   prettierd = {
    --     cwd = require('conform.util').root_file { '.prettierrc', '.prettierrc.json', '.prettierrc.js' },
    --     require_cwd = true,
    --   },
    --   prettier = {
    --     cwd = require('conform.util').root_file { '.prettierrc', '.prettierrc.json', '.prettierrc.js' },
    --     require_cwd = true,
    --   },
    -- },
  },
}
