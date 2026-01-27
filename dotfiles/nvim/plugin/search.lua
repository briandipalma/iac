local FzfLua = require("fzf-lua")
local close_callback = require("my-config/close").close_callback
local close_group = require("my-config/close").close_group
local root = require("my-config/root")
local nml = require("my-config/utils").nml
local xml = require("my-config/utils").xml

---- FzfLua
FzfLua.setup({
	ui_select = true, -- Register fzf-lua as the UI interface for `vim.ui.select`
	winopts = { -- Portrait mode layout
		height = 0.9,
		width = 1,
		preview = { layout = "vertical", vertical = "down:75%" },
	},
	keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } },
})

nml("<Leader>", function()
	FzfLua.files({ cwd = root() })
end, { desc = "Find files (root dir)" })
nml(",", "<Cmd>FzfLua buffers<CR>", { desc = "Find buffer" })

nml("fr", "<Cmd>FzfLua history<CR>", { desc = "Find recent buffers/files" })
nml("fR", function()
	FzfLua.history({ cwd = vim.uv.cwd() })
end, { desc = "Find recent buffers/files (cwd)" })
nml("fF", "<Cmd>FzfLua files<CR>", { desc = "Find files (cwd)" })
nml("fq", "<Cmd>FzfLua quickfix_stack<CR>", { desc = "Find quickfix list" })

nml("sG", "<Cmd>FzfLua live_grep_native<CR>", { desc = "Search text (cwd)" })
nml("sR", "<Cmd>FzfLua resume<CR>", { desc = "Resume last picker" })
nml("sb", "<Cmd>FzfLua lines<CR>", { desc = "Search open buffers lines" })
nml("sg", function()
	FzfLua.live_grep_native({ cwd = root() })
end, { desc = "Search text (root dir)" })
nml("sh", "<Cmd>FzfLua help_tags<CR>", { desc = "Search help pages" })
nml("sk", "<Cmd>FzfLua keymaps<CR>", { desc = "Search keymaps" })
nml("ss", "<Cmd>FzfLua lsp_document_symbols<CR>", { desc = "Search document symbols" })
nml("sw", function()
	FzfLua.grep_cword({ cwd = root() })
end, { desc = "Search for word under cursor (root dir)" })
nml("sW", "<Cmd>FzfLua grep_cword<CR>", { desc = "Search for word under cursor (cwd)" })
xml("sw", function()
	FzfLua.grep_visual({ cwd = root() })
end, { desc = "Search for current selection (root dir)" })
xml("sW", "<Cmd>FzfLua grep_visual<CR>", { desc = "Search for current selection (cwd)" })
nml("sc", "<CMD>FzfLua git_commits<CR>", { desc = "Git log" })
nml("sC", "<CMD>FzfLua git_bcommits<CR>", { desc = "Git current file log" })
----

---- grug-far
nml("sr", "<CMD>GrugFar<CR>", { desc = "Search and replace" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "grug-far" },
	group = close_group,
	callback = close_callback,
})
----
