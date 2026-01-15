return {
	-- lazy-load schemastore when needed
	before_init = function(_, lsp_client_config)
		-- Set it to empty object or it will error
		lsp_client_config.settings.json.schemas = lsp_client_config.settings.json.schemas or {}
		vim.list_extend(lsp_client_config.settings.json.schemas, require("schemastore").json.schemas())
	end,
	settings = { json = { validate = { enable = true } } },
}
