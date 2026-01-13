local nml = require("my-config/utils").nml

-- To check an LSPs capabilities run
-- :lua =vim.lsp.get_clients()[1].server_capabilities

-- LSP progress and `vim.notify` backend
require("fidget").setup({ notification = { override_vim_notify = true } })

nml("cm", "<Cmd>Mason<CR>", { desc = "Mason" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local bufnr = args.buf

		if client:supports_method("textDocument/documentHighlight") then
			vim.api.nvim_create_autocmd({ "CursorHold" }, {
				group = vim.api.nvim_create_augroup("my_lsp_highlight_hold", { clear = false }),
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.document_highlight()
				end,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved" }, {
				group = vim.api.nvim_create_augroup("my_lsp_highlight_moved", { clear = false }),
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.clear_references()
				end,
			})
		end
	end,
})
