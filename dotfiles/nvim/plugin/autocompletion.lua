require("blink.cmp").setup({
	cmdline = { completion = { menu = { auto_show = true } } },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		ghost_text = { enabled = true },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
			},
		},
	},
	signature = { enabled = true },
})
