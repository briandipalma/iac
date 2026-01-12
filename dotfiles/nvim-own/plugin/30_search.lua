local nmap_leader = require("my-config/utils").nmap_leader
local xmap_leader = require("my-config/utils").xmap_leader

MiniDeps.add("ibhagwan/fzf-lua")

require("fzf-lua").setup({
	winopts = {
		height = 0.9,
		width = 1,
		preview = { layout = "vertical", vertical = "down:75%" },
	},
})

nmap_leader("<Leader>", "<Cmd>FzfLua files<CR>", "Find file (root dir)")
nmap_leader(",", "<Cmd>FzfLua buffers<CR>", "Find buffer")
nmap_leader("fr", "<Cmd>FzfLua oldfiles<CR>", "Find recent file")
nmap_leader("sw", "<Cmd>FzfLua grep_cword<CR>", "Search for word under cursor")
xmap_leader("sw", "<Cmd>FzfLua grep_visual<CR>", "Search for current selection")
