local install_package = require("my-config/utils").install_package
local treesitter = require("nvim-treesitter")

install_package("jdtls")

treesitter.install({ "java", "javadoc" })

vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.lsp.enable("jdtls")
