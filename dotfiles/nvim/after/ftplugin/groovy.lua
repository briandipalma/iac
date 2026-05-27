local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("groovy-language-server")
install_package("npm-groovy-lint")

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

vim.lsp.enable("groovyls")

conform.formatters_by_ft.typescript = { "npm-groovy-lint" }
