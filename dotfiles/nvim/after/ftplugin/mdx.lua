local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("mdx-analyzer")
install_package("marksman")
install_package("ltex-ls-plus")
install_package("prettier")
install_package("markdownlint-cli2")

vim.treesitter.language.register("markdown", "mdx")
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

vim.lsp.enable("mdx_analyzer")
vim.lsp.enable("marksman")
vim.lsp.enable("ltex_plus")

conform.formatters_by_ft.mdx = { "prettier" }

require("lint").try_lint("markdownlint-cli2")
