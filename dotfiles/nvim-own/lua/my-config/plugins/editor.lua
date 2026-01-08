local add = MiniDeps.add

add("nvim-mini/mini.starter")

require("mini.starter").setup()

add("nvim-mini/mini.clue")

require("mini.clue").setup()

add("nvim-mini/mini.pick")

require("mini.pick").setup()

add({
	source = "nvim-treesitter/nvim-treesitter",
	checkout = "main",
	-- Perform action after every checkout
	hooks = {
		post_checkout = function()
			vim.cmd("TSUpdate")
		end,
	},
})

require("nvim-treesitter").install({ "javascript", "typescript" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescriptreact" },
	callback = function()
		vim.treesitter.start()
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
