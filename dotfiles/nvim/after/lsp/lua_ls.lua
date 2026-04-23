return {
	settings = {
		Lua = {
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
					vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
					"${3rd}/luv/library",
				},
			},
		},
	},
}
