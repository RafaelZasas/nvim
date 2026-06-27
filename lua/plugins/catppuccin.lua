local catppuccin = {
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = {
        -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = true, -- disables setting the background color.
      float = {
        solid = false,
        transparent = false,
      },
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      kitty = true,
      auto_integrations = true,
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      styles = {
        -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic', 'bold' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
          ok = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
          ok = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      color_overrides = {},
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.rosewater },
          LineNrAbove = { fg = colors.subtext0 },
          LineNrBelow = { fg = colors.subtext0 },
          -- Comment = { fg = colors.flamingo },
          -- TabLineSel = { bg = colors.pink },
          -- CmpBorder = { fg = colors.sky },
          -- PmenuSbar = { bg = colors.overlay2 },
          -- BlinkCmpScrollBarThumb = { bg = colors.sky },
          -- BlinkCmpMenuBorder = { fg = colors.sky },
          -- BlinkCmpMenu = { bg = colors.base, blend = 0 },
          -- PmenuThumb = { bg = colors.rosewater },
          -- BlinkCmpMenuSelection = { bg = colors.overlay2, fg = colors.text },
          -- PmenuSel = { bg = colors.overlay2, fg = colors.text },
        }
      end,
      integrations = {
        gitsigns = true,
        noice = true,
        notify = true,
        nvimtree = true,
        treesitter = true,
        coc_nvim = true,
        mason = true,
        harpoon = true,
        lsp_trouble = true,
        mini = {
          enabled = true,
          indentscope_color = 'lavender', -- catppuccin color (eg. `lavender`) Default: text
        },
        blink_cmp = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    }
  end,
}

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
return catppuccin
