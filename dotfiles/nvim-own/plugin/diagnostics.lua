require("tiny-inline-diagnostic").setup({
	options = {
		add_messages = { display_count = true },
		multilines = { enabled = true },
		show_source = { enabled = true },
	},
})
-- Disable Neovim's default virtual text diagnostics so there aren't duplicate diagnostics
vim.diagnostic.config({ virtual_text = false })
