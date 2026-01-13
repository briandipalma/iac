local nml = require("my-config/utils").nml
local xml = require("my-config/utils").xml

require("fzf-lua").setup({
	winopts = {
		height = 0.9,
		width = 1,
		preview = { layout = "vertical", vertical = "down:75%" },
	},
})

nml("<Leader>", "<Cmd>FzfLua files<CR>", { desc = "Find file (root dir)" })
nml(",", "<Cmd>FzfLua buffers<CR>", { desc = "Find buffer" })
nml("fr", "<Cmd>FzfLua oldfiles<CR>", { desc = "Find recent file" })
nml("sw", "<Cmd>FzfLua grep_cword<CR>", { desc = "Search for word under cursor" })
xml("sw", "<Cmd>FzfLua grep_visual<CR>", { desc = "Search for current selection" })
