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

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(ev)
		local value = ev.data.params.value

		-- Filter out messages for opening TS/JS files
		if value.title:match("Analyzing '(.-)' and its dependencies") then
			return
		end

		vim.api.nvim_echo({ { value.message or "done" } }, false, {
			id = "lsp." .. ev.data.params.token,
			kind = "progress",
			source = "vim.lsp",
			title = value.title,
			status = value.kind ~= "end" and "running" or "success",
			percent = value.percentage,
		})
	end,
})
----

---- Keymaps
nml("il", "<Cmd>checkhealth vim.lsp<CR>", { desc = "LSP checkhealth" })
nml("iL", function()
	vim.cmd("tabnew " .. vim.lsp.log.get_filename())
end, { desc = "LSP log" })

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
