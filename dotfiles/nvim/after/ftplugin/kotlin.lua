local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("kotlin-lsp")
install_package("ktfmt")

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

vim.lsp.enable("kotlin_lsp")

conform.formatters_by_ft.kotlin = { "ktfmt" }
