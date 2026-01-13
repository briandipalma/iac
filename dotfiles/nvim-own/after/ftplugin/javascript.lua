local conform = require("conform")
local install_package = require("my-config/utils").install_package
local treesitter = require("nvim-treesitter")

install_package("eslint-lsp")
install_package("prettier")
install_package("vtsls")

treesitter.install({ "javascript" })

vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.lsp.enable("eslint")
vim.lsp.enable("vtsls")

conform.formatters_by_ft.javascript = { "prettier" }
