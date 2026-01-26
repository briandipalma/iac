local install_package = require("my-config/utils").install_package
local treesitter = require("nvim-treesitter")

install_package("gitleaks")

treesitter.install({ "diff", "gitcommit", "git_rebase" })

vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

require("lint").try_lint("gitleaks")
