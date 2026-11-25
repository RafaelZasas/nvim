return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- Install parsers (async, no-op if already installed)
    require('nvim-treesitter').install {
      'bash',
      'c',
      'diff',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'json5',
      'lua',
      'luadoc',
      'luap',
      'markdown',
      'python',
      'regex',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
      'go',
      'zig',
    }
    -- Enable treesitter highlighting, folding, and indentation for all filetypes
    vim.api.nvim_create_autocmd('FileType', {
      desc = 'Enable treesitter highlighting, folding, and indentation',
      callback = function(ev)
        -- Highlighting: pcall to silently skip filetypes without a parser
        pcall(vim.treesitter.start, ev.buf)
        -- Folding
        -- vim.wo[0][0].foldmethod = 'expr'
        -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- Indentation (experimental)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
