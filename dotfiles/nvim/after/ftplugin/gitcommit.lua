local install_package = require("my-config/utils").install_package

install_package("gitleaks")

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

require("lint").try_lint("gitleaks")
