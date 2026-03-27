local conform = require("conform")
local nml = require("my-config/utils").nml

conform.setup({
	format_on_save = function(bufnr)
		if vim.b[bufnr].disable_autoformat then
			return
		end

		-- ktfmt needs 1 second timeout to format
		return { lsp_format = "fallback", timeout_ms = 1000 }
	end,
})

nml("if", "<Cmd>ConformInfo<CR>", { desc = "Formatting logs" })
nml("uf", function()
	vim.b.disable_autoformat = not vim.b.disable_autoformat
end, { desc = "Toggle buffer formatting" })
