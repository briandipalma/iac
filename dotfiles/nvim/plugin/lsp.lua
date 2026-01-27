local close_callback = require("my-config/close").close_callback
local close_group = require("my-config/close").close_group
local nml = require("my-config/utils").nml

---- Common lsp functionality
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local bufnr = args.buf

		if client:supports_method("textDocument/definition") then
			vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Goto definition" })
		end

		if client:supports_method("textDocument/declaration") then
			vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Goto declaration" })
		end
	end,
})
----

---- Keymaps
nml("il", "<Cmd>LspInfo<CR>", { desc = "LSP info" })
nml("iL", "<Cmd>LspLog<CR>", { desc = "LSP log" })

nml("cm", "<Cmd>Mason<CR>", { desc = "Mason" })
----

---- Utility
-- close some ephemeral git filetypes/buffers with <q>
vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = { "*/lsp.log" },
	group = close_group,
	callback = close_callback,
})
----
