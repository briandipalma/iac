local nml = require("my-config/utils").nml

-- LSP progress and `vim.notify` backend
require("fidget").setup({ notification = { override_vim_notify = true } })

nml("cm", "<Cmd>Mason<CR>", { desc = "Mason" })
