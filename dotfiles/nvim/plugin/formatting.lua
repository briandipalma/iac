local conform = require("conform")

-- ktfmt needs 1 second timeout to format
conform.setup({ format_on_save = { lsp_format = "fallback", timeout_ms = 1000 } })
