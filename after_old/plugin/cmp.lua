local cmp = require("cmp")
local lsp_zero = require("lsp-zero")

local cmp_action = lsp_zero.cmp_action()
local tailwindcss_colors = require("tailwindcss-colorizer-cmp")

local cmp_formatter = function(entry, vim_item)
	-- vim_item as processed by tailwindcss-colorizer-cmp
	vim_item = tailwindcss_colors.formatter(entry, vim_item)
	vim_item.menu = ({
		nvim_lsp = "λ",
		buffer = "[Buffer]",
		path = "🖫",
		emoji = "[Emoji]",
		luasnip = "[LuaSnip]",
		vsnip = "[VSCode Snippet]",
		calc = "[Calc]",
		spell = "[Spell]",
	})[entry.source.name]
	return vim_item
end

cmp.setup({
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	sources = {
		{ name = "nvim_lsp" }, -- lsp
		{ name = "buffer" }, -- text within the current buffer
		{ name = "path" }, -- file system paths
		{ name = "emoji" },
		{ name = "luasnip" },
		{ name = "vsnip" },
		{ name = "calc" },
		--{ name = 'tailwindcss-colors' },
		{
			name = "spell",
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end,
			},
		},
	},
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		-- Abort completion
		["<C-e>"] = cmp.mapping.abort(),

		-- Navigate between snippet placeholder
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),

		-- scroll up and down the documentation window
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),

		-- SuperTab
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	}),
	-- Show source name in completion menu
	formatting = {
		-- changing the order of fields so the icon is the first
		fields = { "abbr", "kind", "menu" },
		format = cmp_formatter,
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})
