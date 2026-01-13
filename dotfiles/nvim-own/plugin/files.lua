local nml = require("my-config/utils").nml

require("mini.files").setup({
	mappings = {
		go_in = "L",
		go_in_plus = "l",
		go_out = "H",
		go_out_plus = "h",
	},
	windows = { width_focus = 45, width_preview = 80 },
})

nml("ee", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "Open mini.files (directory of current file)" })
nml("eE", function()
	require("mini.files").open(vim.uv.cwd(), true)
end, { desc = "Open mini.files (cwd)" })
