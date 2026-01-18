local conform = require("conform")
local install_package = require("my-config/utils").install_package

vim.wo.conceallevel = 2 -- Hide most symbols for cleaner looking documentation
vim.wo.spell = true -- Enable spell checking
vim.wo.wrap = false -- Wrapping can make tables etc hard to read, `markview.nvim` recommends it off

install_package("marksman")
install_package("ltex-ls-plus")
install_package("prettier")
install_package("markdownlint-cli2")

vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.lsp.enable("marksman")
vim.lsp.enable("ltex_plus")

conform.formatters_by_ft.markdown = { "prettier" }

require("lint").try_lint("markdownlint-cli2")
