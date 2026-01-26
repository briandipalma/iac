local nml = require("my-config/utils").nml

---- noice
require("noice").setup({
	presets = {
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
})

nml("in", function()
	require("noice").cmd("history")
end, { desc = "Noice history" })
---

---- Keymaps
nml("uw", function()
	vim.o.wrap = not vim.o.wrap
end, { desc = "Toggle word wrap" })
----
