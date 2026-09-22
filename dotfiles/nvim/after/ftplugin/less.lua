local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("css-lsp")
vim.lsp.enable("cssls")

install_package("prettier")
conform.formatters_by_ft.less = { "prettier" }
