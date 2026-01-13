local nml = require("my-config/utils").nml

return {
	on_attach = function(_, bufnr)
		nml("co", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
			})
		end, { buffer = bufnr, desc = "Organize imports using vtsls" })
	end,
}
