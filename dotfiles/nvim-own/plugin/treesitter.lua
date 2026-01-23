local nml = require("my-config/utils").nml
local treesitter = require("nvim-treesitter")

treesitter.install({ "comment" })

nml("it", "<Cmd>InspectTree<CR>", { desc = "Treesitter tree" })
nml("iT", "<Cmd>Inspect<CR>", { desc = "Treesitter node under cursor" })

local ignored = {
	[""] = true,
	["blink-cmp-menu"] = true,
	["codediff-explorer"] = true,
	["flash_prompt"] = true,
	["fzf"] = true,
	["git"] = true,
	["qf"] = true,
	["mason"] = true,
	["mason_backdrop"] = true,
	["noice"] = true,
	["notify"] = true,
	["minideps-confirm"] = true,
	["minifiles"] = true,
}

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

		vim.notify("No treesitter support for file type " .. _.match .. " in file " .. _.file, vim.log.levels.INFO)
	end,
})
