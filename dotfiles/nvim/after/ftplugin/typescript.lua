local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("eslint-lsp")
install_package("prettier")
install_package("vtsls")

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

vim.lsp.enable("eslint")
vim.lsp.enable("vtsls")

conform.formatters_by_ft.typescript = { "prettier" }
