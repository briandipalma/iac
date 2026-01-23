local conform = require("conform")
local install_package = require("my-config/utils").install_package
local treesitter = require("nvim-treesitter")

install_package("yaml-language-server")
install_package("yamllint")

treesitter.install({ "yaml" })

vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.lsp.enable("yamlls")

conform.formatters_by_ft.yaml = { "prettier" }

require("lint").try_lint("yamllint")
