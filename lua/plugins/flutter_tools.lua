local addFlutterCommands = function()
  local commands = require 'flutter-tools.commands' --@module "flutter-tools.commands"
  local outline = require 'flutter-tools.outline' ---@module "flutter-tools.outline"
  local log = require 'flutter-tools.log' ---@module "flutter-tools.log"

  vim.keymap.set('n', '<leader>fr', commands.run, { desc = '[F]lutter [r]un' })
  vim.keymap.set('n', '<leader>fR', commands.restart, { desc = '[F]lutter [R]estart' })
  vim.keymap.set('n', '<leader>fq', commands.quit, { desc = '[F]lutter [Q]uit' })
  vim.keymap.set('n', '<leader>fl', log.toggle, { desc = '[F]lutter [L]ogs Toggle' })
  vim.keymap.set('n', '<leader>fcl', log.clear, { desc = '[F]lutter [C]lear [L]ogs' })
  vim.keymap.set('n', '<leader>fv', commands.visual_debug, { desc = '[F]lutter [V]isual Debug' })
  vim.keymap.set('n', '<leader>fo', outline.toggle, { desc = '[F]lutter [O]utline Toggle' })
end

return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
    'mfussenegger/nvim-dap', -- optional for debugger
  },
  config = function()
    require('flutter-tools').setup {
      ui = {
        -- the border type to use for all floating windows, the same options/formats
        -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
        border = 'rounded',
        -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
        -- please note that this option is eventually going to be deprecated and users will need to
        -- depend on plugins like `nvim-notify` instead.
        notification_style = 'plugin',
      },
      decorations = {
        statusline = {
          -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
          -- this will show the current version of the flutter app from the pubspec.yaml file
          app_version = true,
          -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
          -- this will show the currently running device if an application was started with a specific
          -- device
          device = true,
          -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
          -- this will show the currently selected project configuration
          project_config = true,
        },
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
        enabled = false,
        run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
        -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
        -- see |:help dap.set_exception_breakpoints()| for more info
        exception_breakpoints = {},
        register_configurations = function(paths)
          require('dap').configurations.dart = {}
        end,
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = 'ErrorMsg', -- highlight for the closing tag
        prefix = '>', -- character to use for close tag e.g. > Widget
        enabled = true, -- set to false to disable
      },
      dev_log = {
        enabled = true,
        notify_errors = false, -- if there is an error whilst running then notify the user
        open_cmd = 'tabedit', -- command to use to open the log buffer
        focus_on_open = false, -- focus the newly opened log window
      },
      dev_tools = {
        autostart = true, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
      },
      outline = {
        open_cmd = '50vnew', -- command to use to open the outline buffer
        auto_open = false, -- if true this will open the outline automatically when it is first populated
      },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = true, -- highlight the background
          background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
          foreground = true, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = '■', -- the virtual text character to highlight
        },
        --capabilities = my_custom_capabilities, -- e.g. lsp_status capabilities
        --- OR you can specify a function to deactivate or change or control how the config is created
        -- see the link below for details on each option:
        -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          analysisExcludedFolders = {
            vim.fn.expand '$HOME/.pub-cache',
            vim.fn.expand '$HOME/.dart-sdk',
            vim.fn.expand '/snap/bin/flutter',
            vim.fn.expand '$HOME/dev/flutter',
            vim.fn.expand '$HOME/snap/',
          },
          renameFilesWithClasses = 'prompt', -- "always"
          enableSnippets = true,
          updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
        },
      },
    }

    addFlutterCommands()
  end,
}
