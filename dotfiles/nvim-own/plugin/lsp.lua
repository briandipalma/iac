local nml = require("my-config/utils").nml

-- To check an LSPs capabilities run
-- :lua =vim.lsp.get_clients()[1].server_capabilities

-- LSP progress and `vim.notify` backend
require("fidget").setup({ notification = { override_vim_notify = true } })

nml("cm", "<Cmd>Mason<CR>", { desc = "Mason" })
