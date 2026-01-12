-- local install_package = require("my-config/utils").install_package

MiniDeps.add("stevearc/conform.nvim")
MiniDeps.add("mason-org/mason.nvim")
-- MiniDeps.later(function()
-- 	install_package("prettier")
-- end)

local conform = require("conform")

conform.setup({
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})
-- conform.formatters_by_ft.html = { "prettier" }
