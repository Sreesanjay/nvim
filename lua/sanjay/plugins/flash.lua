return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		modes = {
			search = {
				enabled = true,
			},
			char = {
				jump_labels = true,
			},
		},
	},
	 -- stylua: ignore
	 keys = {
	   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash", nowait = true },
	   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", nowait = true },
	   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash", nowait = true },
	   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search", nowait = true },
	   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search", nowait = true },
	 },
}
