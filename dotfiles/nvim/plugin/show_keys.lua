local keys = require("which-key")

keys.setup({
	preset = "modern",
	spec = {
		{ "<Leader>b", group = "Buffers" },
		{ "<Leader>c", group = "Code" },
		{ "<Leader>d", group = "Dependencies" },
		{ "<Leader>e", group = "Explorer" },
		{ "<Leader>f", group = "Find" },
		{ "<Leader>g", group = "Git" },
		{ "<Leader>h", group = "Hunks" },
		{ "<Leader>i", group = "Info" },
		{ "<Leader>q", group = "Quit" },
		{ "<Leader>r", group = "Run" },
		{ "<Leader>s", group = "Search" },
		{ "<Leader>u", group = "UI" },
	},
})
