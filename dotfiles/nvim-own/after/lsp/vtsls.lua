local nml = require("my-config/utils").nml

return {
	-- https://github.com/yioneko/vtsls/blob/main/packages/service/configuration.schema.json
	settings = {
		javascript = {
			updateImportsOnFileMove = { enabled = "always" },
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			-- tsserver = { log = "verbose" }, -- For debugging server
		},
		vtsls = { autoUseWorkspaceTsdk = true },
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("User", {
			pattern = { "MiniFilesActionMove", "MiniFilesActionRename" },
			callback = function(event)
				local oldUri = vim.uri_from_fname(event.data.from)
				local newUri = vim.uri_from_fname(event.data.to)
				local changes = { files = { { oldUri = oldUri, newUri = newUri } } }

				client.notify("workspace/didRenameFiles", changes)
			end,
		})

		-- Comment back in to debug server
		-- nml("cl", function()
		-- 	client:exec_cmd({
		-- 		command = "typescript.openTsServerLog",
		-- 	}, { bufnr = bufnr })
		-- end, { buffer = bufnr, desc = "Organize imports using vtsls" })

		nml("co", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
			})
		end, { buffer = bufnr, desc = "Organize imports using vtsls" })
	end,
}
