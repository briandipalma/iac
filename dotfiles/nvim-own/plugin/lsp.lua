local close_callback = require("my-config/close").close_callback
local close_group = require("my-config/close").close_group
local nml = require("my-config/utils").nml

-- LSP progress and `vim.notify` backend
require("fidget").setup({ notification = { override_vim_notify = true } })

nml("cm", "<Cmd>Mason<CR>", { desc = "Mason" })

vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = { "*/lsp.log" },
	group = close_group,
	callback = close_callback,
})
