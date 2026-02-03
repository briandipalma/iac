local conform = require("conform")
local install_package = require("my-config/utils").install_package
local treesitter = require("nvim-treesitter")

install_package("mdx-analyzer")
install_package("marksman")
install_package("ltex-ls-plus")
install_package("prettier")
install_package("markdownlint-cli2")

treesitter.install({ "markdown", "markdown_inline" })

vim.treesitter.language.register("markdown", "mdx")
vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.lsp.enable("mdx_analyzer")
vim.lsp.enable("marksman")
vim.lsp.enable("ltex_plus")

conform.formatters_by_ft.markdown = { "prettier" }

require("lint").try_lint("markdownlint-cli2")
