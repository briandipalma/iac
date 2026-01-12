local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("prettier")
require("nvim-treesitter").install({ "html" })
conform.formatters_by_ft.html = { "prettier" }
