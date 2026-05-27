local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("fish-lsp")

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

vim.lsp.enable("fish_lsp")

conform.formatters_by_ft.fish = { "fish_indent" }

require("lint").try_lint("fish")
