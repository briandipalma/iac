local keys = require("which-key")

keys.setup({
	preset = "modern",
	spec = {
		{ "<Leader>b", group = "Buffers" },
		{ "<Leader>c", group = "Code" },
		{ "<Leader>d", group = "Dependencies" },
		{ "<Leader>e", group = "Explorer" },
		{ "<Leader>f", group = "Find" },
		{ "<Leader>s", group = "Search" },
		{ "<Leader>s", group = "Search" },
		{ "<Leader>g", group = "Git" },
		{ "<Leader>h", group = "Hunks" },
		{ "<Leader>h", group = "Hunks" },
		{ "<Leader>i", group = "Info" },
		{ "<Leader>u", group = "UI" },
	},
})
