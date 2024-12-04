# My Neovim Configuration

Based almost entirely on The Primeagen.

Will be updating as I go.

# !IMPORTANT!

This entire setup of mine is, well, mine.
This means that all of the installed plugins, keybinds, language servers and their configuations
are relevant to me, and my work. It's mostly sensible IMO but your milage may vary.

**Language Servers**

Please be sure to look in the `lsp.lua` file for the lua table of `servers` and
add/remove any language servers you want.

At the time of writing this, the definition for the servers table is around line
number *100* and the block looks a bit like this:

```lua
    local servers = {
      gopls = {
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        single_file_support = true,
      },

      tailwindcss = {
        filetypes = {
          'html',
          'css',
          'scss',
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact',
          'svelte',
          'vue',
          'templ',
        },
        root_dir = lspconfig.util.root_pattern(
          'tailwind.config.js',
          'tailwind.config.cjs',
          'tailwind.config.ts',
          'tailwind.config.tsx',
          'tailwind.config.json',
          '.git'
        ),
        settings = {
          tailwindCSS = {
            classAttributes = { 'class', 'className', 'class:list', 'classList', 'ngClass' },
            lint = {
              cssConflict = 'warning',
              invalidApply = 'error',
              invalidConfigPath = 'error',
              invalidScreen = 'error',
              invalidTailwindDirective = 'error',
              invalidVariant = 'error',
              recommendedVariantOrder = 'warning',
            },
            includeLanguages = {
              css = 'css',
              javascript = 'javascript',
              javascriptreact = 'javascript',
              typescript = 'javascript',
              typescriptreact = 'javascript',
              svelte = 'html',
              vue = 'html',
              templ = 'html',
            },
            validate = true,
          },
        },
      },

      -- Typescript / Javascript
      tsserver = {},
      yamlls = {},
      yamlfmt = {},

      html = {
        filetypes = { 'html', 'templ' },
      },

      htmx = {
        filetypes = { 'html', 'templ' },
      },
    -- more language servers ...
    }
```

If all of this is confusing to you, all I have to offer is, google Mason neovim
and RTFM :)

