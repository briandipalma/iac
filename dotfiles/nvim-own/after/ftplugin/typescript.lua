local conform = require("conform")
local install_package = require("my-config/utils").install_package

install_package("vtsls")
install_package("prettier")
require("nvim-treesitter").install({ "typescript" })
conform.formatters_by_ft.typescript = { "prettier" }

vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
