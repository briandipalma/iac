local conform = require("conform")
local install_package = require("my-config/utils").install_package
local lint = require("lint")
local treesitter = require("nvim-treesitter")

treesitter.install({ "fish" })
vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

install_package("fish-lsp")
vim.lsp.enable("fish_lsp")

conform.formatters_by_ft.fish = { "fish_indent" }
lint.try_lint("fish")
