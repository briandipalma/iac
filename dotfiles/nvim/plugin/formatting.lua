local conform = require("conform")
local nml = require("my-config/utils").nml

-- ktfmt needs 1 second timeout to format
conform.setup({ format_on_save = { lsp_format = "fallback", timeout_ms = 1000 } })

nml("if", "<Cmd>ConformInfo<CR>", { desc = "Formatting logs" })
