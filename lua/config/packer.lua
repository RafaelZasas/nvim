-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Pretty menu to see files
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Color Scheme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- sitting on trees, looking at the vue
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Just swingin around
    use('theprimeagen/harpoon')

    -- everybody makes mistakes, everybody has those days
    use('mbbill/undotree')

    -- running from the git police
    use('tpope/vim-fugitive')

    -- still dont know what lsp stands for but im about it
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --------- LSP Support ------------------
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},  -- Optional

            {'neovim/nvim-lspconfig'},              -- Required
            -------- Autocompletion ----------------

            {'hrsh7th/nvim-cmp'},                   -- Required
            {'hrsh7th/cmp-nvim-lsp'},               -- Required
            {'L3MON4D3/LuaSnip'},                   -- Required
            {'saadparwaiz1/cmp_luasnip'},           -- Optional
            {'hrsh7th/cmp-buffer'},                 -- Optional
            {'hrsh7th/cmp-path'},                   -- Optional
            {'hrsh7th/cmp-calc'},                   -- Optional
            {'hrsh7th/cmp-emoji'},                  -- Optional
            {'f3fora/cmp-spell'},                   -- Optional
            {'hrsh7th/cmp-vsnip'},                  -- Optional
            {'hrsh7th/vim-vsnip'},                  -- Optional
            {'rafamadriz/friendly-snippets'},       -- Optional
        }
    }
    -- I dont like closing brackets on my own
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    

    -- I like to let my co pilot take the wheel
    use {'github/copilot.vim', branch="release"}

    -- I like to see what im doing
  --  use({
  --      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --      config = function()
  --          require("lsp_lines").setup()
  --      end,
  --  })

  end)
