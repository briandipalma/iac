local conform = require("conform")
local install_package = require("my-config/utils").install_package
local treesitter = require("nvim-treesitter")

install_package("lua-language-server")
install_package("stylua")

treesitter.install({ "luadoc", "lua" })

vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.lsp.enable("lua_ls")
vim.lsp.enable("stylua")

conform.formatters_by_ft.lua = { "stylua" }
