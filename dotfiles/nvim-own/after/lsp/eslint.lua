return {
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				local pull_diagnostics =
					vim.diagnostic.get(bufnr, { namespace = vim.lsp.diagnostic.get_namespace(client.id, true) })

				if #pull_diagnostics > 0 then
					client:request_sync("workspace/executeCommand", {
						command = "eslint.applyAllFixes",
						arguments = {
							{
								uri = vim.uri_from_bufnr(bufnr),
								version = vim.lsp.util.buf_versions[bufnr],
							},
						},
					}, nil, bufnr)
				end
			end,
		})
	end,
}
