MiniDeps.add("neovim/nvim-lspconfig")
MiniDeps.add("mason-org/mason.nvim")
MiniDeps.add("mason-org/mason-lspconfig.nvim")

require("mason").setup()
-- To check an LSPs capabilities run
-- :lua =vim.lsp.get_clients()[1].server_capabilities
require("mason-lspconfig").setup({ ensure_installed = { "vtsls", "eslint" } })

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
