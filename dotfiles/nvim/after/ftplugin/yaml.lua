local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("yaml-language-server")
install_package("yamllint")

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

vim.lsp.enable("yamlls")

conform.formatters_by_ft.yaml = { "prettier" }

require("lint").try_lint("yamllint")
