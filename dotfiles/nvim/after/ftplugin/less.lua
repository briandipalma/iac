local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("css-lsp")
install_package("prettier")

vim.lsp.enable("cssls")

conform.formatters_by_ft.less = { "prettier" }
