-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	----------------- LSP Stuff --------------------------------

	-- sitting on trees, looking at the vue
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- I think this is major overkill but why not
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--------- LSP Support ------------------
			{ "neovim/nvim-lspconfig" }, -- Required

			{ "williamboman/mason.nvim" }, -- Package manager for LSP's
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-------- Autocompletion ----------------
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "hrsh7th/cmp-calc" }, -- Optional
			{ "hrsh7th/cmp-emoji" }, -- Optional
			{ "f3fora/cmp-spell" }, -- Optional
			{ "hrsh7th/cmp-vsnip" }, -- Optional
			{ "hrsh7th/vim-vsnip" }, -- Optional
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})

	use("nvimtools/none-ls.nvim") -- For formatters and linters

	------------ Navigation stuff -------------------

	-- Pretty menu to see files
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Just swingin around
	-- Really nifty quick file navigation
	use("theprimeagen/harpoon")

	-- everybody makes mistakes, everybody has those days
	use("mbbill/undotree")

	-- running from the git police
	use("tpope/vim-fugitive")

	use({
		"folke/trouble.nvim",
	})

	--------------- UI Stuff -----------------------

	-- Color Scheme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Fancy icons
	use("nvim-tree/nvim-web-devicons")

	-- Tailwindcss colors
	use("roobert/tailwindcss-colorizer-cmp.nvim")

	--------- Quality of Life stuff ----------------

	-- I dont like closing brackets on my own
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- I like to let my co pilot take the wheel
	use({ "github/copilot.vim", branch = "release" })

	-- I like to see what im doing
	--  use({
	--      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	--      config = function()
	--          require("lsp_lines").setup()
	--      end,
	--  })

	-- Automatically install packer and sync
	if packer_bootstrap then
		require("packer").sync()
	end
end)
