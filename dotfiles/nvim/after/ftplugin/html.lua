local conform = require("conform")
local install_package = require("my-config/utils").install_package
local lint = require("lint")
local treesitter = require("nvim-treesitter")

treesitter.install({ "html" })
vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

install_package("html-lsp")
vim.lsp.enable("html")

install_package("prettier")
conform.formatters_by_ft.html = { "prettier" }

install_package("htmlhint")
lint.try_lint("htmlhint")
