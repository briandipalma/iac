return {
	"folke/snacks.nvim",
	opts = {
		indent = {
			enabled = false,
		},
		scratch = {
			win = {
				keys = {
					["delete"] = {
						"<a-x>",
						function(self)
							vim.api.nvim_win_call(self.win, function()
								vim.cmd([[close]])
								os.remove(vim.api.nvim_buf_get_name(self.buf))
							end)
						end,
						desc = "Delete buffer",
						mode = { "n", "x" },
					},
				},
			},
		},
	},
}
