local conform = require("conform")
local install_package = require("my-config/utils").install_package
local lint = require("lint")
local treesitter = require("nvim-treesitter")

-- Conceallevel is great for rendering clean docs in both files and hover windows
vim.wo.conceallevel = 2

treesitter.install({ "markdown" })
vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Only configure spellcheck, nowrap, LSP servers, and linters/formatters for real markdown files
local is_real_file = vim.bo.buftype == ""

if is_real_file then
	vim.wo.spell = true -- Enable spell checking
	vim.wo.wrap = false -- Wrapping can make tables etc hard to read, `markview.nvim` recommends it off

	install_package("marksman")
	install_package("ltex-ls-plus")
	vim.lsp.enable("marksman")
	vim.lsp.enable("ltex_plus")

	install_package("prettier")
	conform.formatters_by_ft.markdown = { "prettier" }

	install_package("markdownlint-cli2")
	lint.try_lint("markdownlint-cli2")
end
