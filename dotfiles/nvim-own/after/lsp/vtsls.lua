local nml = require("my-config/utils").nml

return {
	-- https://github.com/yioneko/vtsls/blob/main/packages/service/configuration.schema.json
	settings = {
		javascript = {
			referencesCodeLens = { enabled = true, showOnAllFunctions = true },
			updateImportsOnFileMove = { enabled = "always" },
			preferences = { importModuleSpecifier = "project-relative" },
			format = { enable = false },
			inlayHints = {
				parameterNames = { enabled = "all" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
			},
		},
		typescript = {
			referencesCodeLens = { enabled = true, showOnAllFunctions = true },
			implementationsCodeLens = { enabled = true, showOnInterfaceMethods = true, showOnAllClassMethods = true },
			updateImportsOnFileMove = { enabled = "always" },
			preferences = { importModuleSpecifier = "project-relative", preferTypeOnlyAutoImports = true },
			format = { enable = false },
			inlayHints = {
				parameterNames = { enabled = "all" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
			-- tsserver = { log = "verbose" }, -- For debugging server
		},
		vtsls = { autoUseWorkspaceTsdk = true },
	},
	on_attach = function(client, bufnr)
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		vim.lsp.codelens.refresh()

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
		-- end, { buffer = bufnr, desc = "Open debug log" })

		nml("co", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
			})
		end, { buffer = bufnr, desc = "Organize imports using vtsls" })
	end,
}
