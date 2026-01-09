MiniDeps.add("ibhagwan/fzf-lua")

require("fzf-lua").setup({
	winopts = {
		height = 0.9,
		width = 1,
		preview = { layout = "vertical", vertical = "down:75%" },
	},
})

local nmap_leader = function(suffix, rhs, desc)
	vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
end

nmap_leader("<Leader>", "<Cmd>FzfLua files<CR>", "Find file (root dir)")
nmap_leader(",", "<Cmd>FzfLua buffers<CR>", "Find buffer")
nmap_leader("fr", "<Cmd>FzfLua oldfiles<CR>", "Find recent file")
nmap_leader("sw", "<Cmd>FzfLua grep_cword<CR>", "Search for word under cursor")
