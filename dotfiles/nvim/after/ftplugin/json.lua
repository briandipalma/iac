local conform = require("conform")
local install_package = require("my-config/utils").install_package
local treesitter = require("nvim-treesitter")

treesitter.install({ "json" })
vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

install_package("json-lsp")
vim.lsp.enable("jsonls")

install_package("prettier")
conform.formatters_by_ft.json = { "prettier" }
