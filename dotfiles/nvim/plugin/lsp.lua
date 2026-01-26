local close_callback = require("my-config/close").close_callback
local close_group = require("my-config/close").close_group
local nml = require("my-config/utils").nml

nml("il", "<Cmd>LspInfo<CR>", { desc = "LSP info" })
nml("iL", "<Cmd>LspLog<CR>", { desc = "LSP log" })

nml("cm", "<Cmd>Mason<CR>", { desc = "Mason" })

vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = { "*/lsp.log" },
	group = close_group,
	callback = close_callback,
})
