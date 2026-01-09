MiniDeps.add("ibhagwan/fzf-lua")

require("fzf-lua").setup({
	winopts = {
		height = 0.9,
		width = 1,
		preview = { layout = "vertical", vertical = "down:75%" },
	},
})
