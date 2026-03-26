---@module 'lazy'
---@type LazySpec
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.config
	opts = {
		bigfile = { enabled = true },
        	dashboard = { example = "compact_files" },
        	explorer = { enabled = true },
		gh = {enabled = true},
		image = {enabled = true},
        	indent = { enabled = true },
        	input = { enabled = true },
		lazygit = {enabled = true},
        	notifier = { enabled = true },
        	picker = { enabled = true },
        	quickfile = { enabled = true },
        	scope = { enabled = true },
        	scroll = { enabled = true },
        	statuscolumn = { enabled = true },
        	words = { enabled = true },
	},
}
