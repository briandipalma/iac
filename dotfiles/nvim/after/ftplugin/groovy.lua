local conform = require("conform")
local install_package = require("my-config/utils").install_package
local treesitter = require("nvim-treesitter")

treesitter.install({ "groovy" })
vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

install_package("groovy-language-server")
vim.lsp.enable("groovyls")

install_package("npm-groovy-lint")
conform.formatters_by_ft.typescript = { "npm-groovy-lint" }
