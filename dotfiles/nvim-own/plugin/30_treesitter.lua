MiniDeps.add({
	source = "nvim-treesitter/nvim-treesitter",
	hooks = {
		post_checkout = function()
			vim.cmd("TSUpdate")
		end,
	},
})
MiniDeps.add("nvim-treesitter/nvim-treesitter-context")

-- require("nvim-treesitter").install({ "javascript", "tsx" })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	-- lua print(vim.bo.filetype) to find out filetype
-- 	pattern = { "javascript", "tsx", "typescript" },
-- 	callback = function()
-- 		vim.treesitter.start()
-- 		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- 		vim.wo[0][0].foldmethod = "expr"
-- 		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 	end,
-- })
