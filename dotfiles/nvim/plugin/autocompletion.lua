require("blink.cmp").setup({
	cmdline = { completion = { menu = { auto_show = true } } },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		ghost_text = { enabled = true },
		menu = {
			auto_show = true,
			cmdline_position = function()
				if vim.g.ui_cmdline_pos ~= nil then
					local pos = vim.g.ui_cmdline_pos
					return { pos[1] - 1, pos[2] + 1 } -- Tweak position of autocomplete menu for noice.nvim cmdline
				end
				local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
				return { vim.o.lines - height, 0 }
			end,
			draw = {
				treesitter = { "lsp" },
			},
		},
	},
	signature = { enabled = true },
})
