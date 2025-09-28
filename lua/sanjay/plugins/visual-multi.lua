return {
	"mg979/vim-visual-multi",
	branch = "master", -- make sure you're using the correct branch
	init = function()
		-- Optional: customize keybindings here
		vim.g.VM_maps = {
			["Find Under"] = "<C-d>", -- like VSCode multi-cursor
			["Find Subword Under"] = "<C-d>",
			["Select All"] = "\\A", -- select all occurrences
		}

		-- Optional: other custom settings
		vim.g.VM_default_mappings = 1
		vim.g.VM_theme = "iceblue"
		vim.g.VM_show_warnings = 0
	end,
}
