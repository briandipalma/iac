local add = MiniDeps.add

add("nvim-mini/mini.starter")

require("mini.starter").setup()

add("nvim-mini/mini.clue")

require("mini.clue").setup()

add({
	source = "ibhagwan/fzf-lua",
	depends = { "nvim-tree/nvim-web-devicons" },
})

require("nvim-web-devicons").setup()
require("fzf-lua").setup({
	winopts = {
		height = 0.9,
		width = 1,
		preview = { layout = "vertical", vertical = "down:75%" },
	},
})

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

require("nvim-treesitter").install({ "javascript", "tsx", "typescript" })

vim.api.nvim_create_autocmd("FileType", {
	-- lua print(vim.bo.filetype) to find out filetype
	pattern = { "javascript", "tsx", "typescript" },
	callback = function()
		vim.treesitter.start()
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
