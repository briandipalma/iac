MiniDeps.add("stevearc/conform.nvim")
MiniDeps.add("mason-org/mason.nvim")

local conform = require("conform")

conform.setup({ format_on_save = { lsp_format = "fallback", timeout_ms = 500 } })
