local nml = require("my-config/utils").nml

require("noice").setup({
	presets = {
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
})

nml("in", function()
	require("noice").cmd("history")
end, { desc = "Noice history" })
