return {
	on_attach = function(_, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "OrganizeImports", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
			})
		end, { desc = "Organize imports using vtsls" })
	end,
}
