local fzfLua = require("fzf-lua")
local root = require("my-config/root")
local nml = require("my-config/utils").nml
local xml = require("my-config/utils").xml

fzfLua.setup({
	ui_select = true, -- Register fzf-lua as the UI interface for `vim.ui.select`
	winopts = { -- Portrait mode layout
		height = 0.9,
		width = 1,
		preview = { layout = "vertical", vertical = "down:75%" },
	},
})

nml("<Leader>", function()
	fzfLua.files({ cwd = root() })
end, { desc = "Find files (root dir)" })
nml(",", "<Cmd>FzfLua buffers<CR>", { desc = "Find buffer" })

nml("fr", "<Cmd>FzfLua history<CR>", { desc = "Find recent buffers/files" })
nml("fR", function()
	fzfLua.history({ cwd = vim.uv.cwd() })
end, { desc = "Find recent buffers/files (cwd)" })
nml("fF", "<Cmd>FzfLua files<CR>", { desc = "Find files (cwd)" })

nml("sG", "<Cmd>FzfLua live_grep_native<CR>", { desc = "Search text (cwd)" })
nml("sR", "<Cmd>FzfLua resume<CR>", { desc = "Resume last picker" })
nml("sb", "<Cmd>FzfLua lines<CR>", { desc = "Search open buffers lines" })
nml("sg", function()
	fzfLua.live_grep_native({ cwd = root() })
end, { desc = "Search text (root dir)" })
nml("sh", "<Cmd>FzfLua help_tags<CR>", { desc = "Search help pages" })
nml("sk", "<Cmd>FzfLua keymaps<CR>", { desc = "Search keymaps" })
nml("ss", "<Cmd>FzfLua lsp_document_symbols<CR>", { desc = "Search document symbols" })
nml("sw", function()
	fzfLua.grep_cword({ cwd = root() })
end, { desc = "Search for word under cursor (root dir)" })
nml("sW", "<Cmd>FzfLua grep_cword<CR>", { desc = "Search for word under cursor (cwd)" })
xml("sw", function()
	fzfLua.grep_visual({ cwd = root() })
end, { desc = "Search for current selection (root dir)" })
xml("sW", "<Cmd>FzfLua grep_visual<CR>", { desc = "Search for current selection (cwd)" })
nml("sc", "<CMD>FzfLua git_commits<CR>", { desc = "Git log" })
nml("sC", "<CMD>FzfLua git_bcommits<CR>", { desc = "Git current file log" })
