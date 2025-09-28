return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		-- "saghen/blink.cmp",
	},
	config = function()
		-- import mason and mason_lspconfig
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- NOTE: Moved these local imports below back to lspconfig.lua due to mason depracated handlers

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_enable = false,
			-- servers for mason to install
			ensure_installed = {
				"lua_ls",
				"ts_ls", -- currently using a ts plugin
				"html",
				"cssls",
				"tailwindcss",
				"emmet_ls",
				"emmet_language_server",
				-- "eslint",
				"marksman",
				"vtsls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"clangd",
				"denols",
				{ "eslint_d", version = "13.1.2" },
			},
		})
	end,
}
