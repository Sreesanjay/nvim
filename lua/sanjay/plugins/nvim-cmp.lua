return {
	"hrsh7th/nvim-cmp",
	branch = "main",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"nvim-treesitter/nvim-treesitter",
		"onsails/lspkind.nvim",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local has_luasnip, luasnip = pcall(require, "luasnip")
		local lspkind = require("lspkind")
		local colorizer = require("tailwindcss-colorizer-cmp").formatter

		-- Utility
		local select_next_item = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end
		local select_prev_item = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end
		local confirm = function(entry)
			if entry then
				cmp.confirm({ select = true })
			end
		end

		-- Load snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-Space>"] = cmp.mapping.complete(), -- trigger completion

				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						confirm(entry)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif has_luasnip and luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif has_luasnip and luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-j>"] = select_next_item,
				["<C-k>"] = select_prev_item,
				["<Down>"] = select_next_item,
				["<Up>"] = select_prev_item,
			}),
			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "tailwindcss-colorizer-cmp" },
			}),
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s %s", lspkind.presets.default[vim_item.kind] or "", vim_item.kind)
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
					})[entry.source.name]
					if entry.source.name == "nvim_lsp" then
						vim_item = colorizer(entry, vim_item)
					end
					return vim_item
				end,
			},
			experimental = { ghost_text = false },
			completion = { completeopt = "menu,menuone,noinsert" },
			window = {
				documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
				completion = { border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } },
			},
		})
	end,
}
