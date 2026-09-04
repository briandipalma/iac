local conform = require("conform")
local install_package = require("my-config/utils").install_package
local treesitter = require("nvim-treesitter")

treesitter.install({ "jsonc" })
vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

install_package("json-lsp")
vim.lsp.enable("jsonls")

install_package("prettier")
-- https://github.com/prettier/prettier/issues/15956
conform.formatters.prettier_jsonc = {
	inherit = "prettier",
	append_args = { "--trailing-comma", "none" },
}
conform.formatters_by_ft.jsonc = { "prettier_jsonc" }
