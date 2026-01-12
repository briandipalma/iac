local nmap_leader = require("my-config/utils").nmap_leader

MiniDeps.add("neovim/nvim-lspconfig")
MiniDeps.add("mason-org/mason.nvim")
MiniDeps.add("mason-org/mason-lspconfig.nvim")

require("mason").setup()
-- To check an LSPs capabilities run
-- :lua =vim.lsp.get_clients()[1].server_capabilities
-- :LspInstall to select a server based on the current buffer's &filetype
require("mason-lspconfig").setup({ ensure_installed = { "eslint", "html", "vtsls" } })

nmap_leader("cm", "<Cmd>Mason<CR>", "Mason")

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

vim.lsp.config("vtsls", {
	on_attach = function(_, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "OrganizeImports", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
			})
		end, { desc = "Organize imports using vtsls" })
	end,
})
