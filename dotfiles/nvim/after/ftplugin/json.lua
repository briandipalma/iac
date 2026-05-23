local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("json-lsp")
install_package("prettier")

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

vim.lsp.enable("jsonls")

conform.formatters_by_ft.json = { "prettier" }
