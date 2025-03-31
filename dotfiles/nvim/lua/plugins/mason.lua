return {
	"williamboman/mason.nvim",
	opts = function(_, opts)
		table.insert(opts.ensure_installed, "css-lsp")
		table.insert(opts.ensure_installed, "ktfmt")
		table.insert(opts.ensure_installed, "ltex-ls")
		table.insert(opts.ensure_installed, "lua-language-server")
	end,
}
