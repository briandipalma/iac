local nml = require("my-config/utils").nml
local treesitter = require("nvim-treesitter")

treesitter.install({ "comment" })

nml("it", "<Cmd>InspectTree<CR>", { desc = "Treesitter tree" })
nml("iT", "<Cmd>Inspect<CR>", { desc = "Treesitter node under cursor" })

local ignored = { ["fzf"] = true, ["fidget"] = true }

vim.api.nvim_create_autocmd("FileType", {
	callback = function(_)
		if vim.treesitter.language.add(_.match) then
			return
		end

		if vim.treesitter.get_parser(nil, nil, { error = false }) then
			return
		end

		if ignored[_.match] then
			return
		end

		vim.print(_)
	end,
})
