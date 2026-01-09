MiniDeps.add("neovim/nvim-lspconfig")
MiniDeps.add("mason-org/mason.nvim")
MiniDeps.add("mason-org/mason-lspconfig.nvim")

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "vtsls" } })
