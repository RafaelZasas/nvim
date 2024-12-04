local catppuccin =  {
  'catppuccin/nvim',
  name = 'catppuccin',
  config =  function()
  require('catppuccin').setup {
    flavour = 'mocha', -- latte, frappe, macchiato, mocha
    background = {
      -- :h background
      light = 'latte',
      dark = 'mocha',
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = true, -- dims the background color of inactive window
      shade = 'dark',
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
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
    color_overrides = {},
    custom_highlights = function(colors)
      return {
        --         Comment = { fg = colors.flamingo },
        TabLineSel = { bg = colors.pink },
        CmpBorder = { fg = colors.sky },
        Pmenu = { bg = colors.overlay },
        PmenuSbar = { bg = colors.overlay2 },
        PmenuSel = { bg = colors.overlays },
      }
    end,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      coc_nvim = true,
      mason = true,
      harpoon = true,
      lsp_trouble = true,
      mini = {
        enabled = true,
        indentscope_color = '', -- catppuccin color (eg. `lavender`) Default: text
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
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
      color_overrides = {},
      custom_highlights = function(colors)
        return {
          --         Comment = { fg = colors.flamingo },
          TabLineSel = { bg = colors.pink },
          CmpBorder = { fg = colors.sky },
          Pmenu = { bg = colors.overlay },
          PmenuSbar = { bg = colors.overlay2 },
          PmenuSel = { bg = colors.overlays },
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        coc_nvim = true,
        mason = true,
        harpoon = true,
        lsp_trouble = true,
        mini = {
          enabled = true,
          indentscope_color = '', -- catppuccin color (eg. `lavender`) Default: text
        },
        telescope = {
          enabled = true,
          --style = "nvchad"
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
          },
          inlay_hints = {
            background = true,
          },
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  }
end
}

return catppuccin

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
