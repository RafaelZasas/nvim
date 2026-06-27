-- local tailwindcss_colors = require 'tailwindcss-colorizer-cmp'

-- local cmp_formatter = function(entry, vim_item)
--   -- vim_item as processed by tailwindcss-colorizer-cmp
--   vim_item = tailwindcss_colors.formatter(entry, vim_item)
--   vim_item.menu = ({
--     nvim_lsp = 'λ',
--     buffer = '[Buffer]',
--     path = '🖫',
--     emoji = '[Emoji]',
--     luasnip = '[LuaSnip]',
--     vsnip = '[VSCode Snippet]',
--     calc = '[Calc]',
--     spell = '[Spell]',
--   })[entry.source.name]
--   return vim_item
-- end

-- Autocompletion with blink.cmp
return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.7.0',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets
        -- This step is not supported in many windows environments
        -- Remove the below condition to re-enable on windows
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    -- 'saadparwaiz1/cmp_luasnip',

    -- 'f3fora/cmp-spell', -- SpellChecker

    'rafamadriz/friendly-snippets',
    'folke/lazydev.nvim',
    'onsails/lspkind.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',

      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      --       -- Think of <c-l> as moving to the right of your snippet expansion.
      --       --  So if you have a snippet that's like:
      --       --  function $name($args)
      --       --    $body
      --       --  end
      --       --
      --       -- <c-l> will move you to the right of each of the expansion locations.
      --       -- <c-h> is similar, except moving you backwards.
      --       ['<C-l>'] = cmp.mapping(function()
      --         if luasnip.expand_or_locally_jumpable() then
      --           luasnip.expand_or_jump()
      --         end
      --       end, { 'i', 's' }),
      --       ['<C-h>'] = cmp.mapping(function()
      --         if luasnip.locally_jumpable(-1) then
      --           luasnip.jump(-1)
      --         end
      --       end, { 'i', 's' }),
      --     },
    },
    appearance = {
      nerd_font_variant = 'mono',
      kind_icons = {
        nvim_lsp = 'λ',
        path = '🖫',
      },
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,
        treesitter_highlighting = true,
        window = {
          border = 'rounded',
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
        },
      },
      menu = {
        winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
        winblend = 0,
        draw = {
          treesitter = { 'lsp' },
          gap = 2,
          columns = {
            { 'kind_icon', 'label', 'label_description', gap = 1 },
            { 'kind', 'source_name', gap = 1 },
          },
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                  local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require('lspkind').symbolic(ctx.kind, {
                    mode = 'symbol',
                  })
                end

                return icon .. ctx.icon_gap
              end,

              -- Optionally, use the highlight groups from nvim-web-devicons
              -- You can also add the same function for `kind.highlight` if you want to
              -- keep the highlight groups in sync with the icons.
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                  local dev_icon, dev_hl = require('nvim-web-devicons').get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end,
            },
          },
        },
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    fuzzy = {
      implementation = 'prefer_rust_with_warning',
      prebuilt_binaries = {
        download = true,
      },
    },

    signature = {
      enabled = true,
      window = {
        border = 'rounded',
        winhighlight = 'Normal:BlinkCmpSignature,FloatBorder:BlinkCmpSignatureBorder,CursorLine:BlinkCmpSignatureCursorLine,Search:None',
        winblend = 0,
      },
    },
  },
}
