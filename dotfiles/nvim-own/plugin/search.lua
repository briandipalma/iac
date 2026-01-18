local nml = require("my-config/utils").nml
local xml = require("my-config/utils").xml

require("fzf-lua").setup({
	ui_select = true, -- Register fzf-lua as the UI interface for `vim.ui.select`
	winopts = {
		height = 0.9,
		width = 1,
		preview = { layout = "vertical", vertical = "down:75%" },
	},
})

nml("<Leader>", "<Cmd>FzfLua files<CR>", { desc = "Find file (root dir)" })
nml(",", "<Cmd>FzfLua buffers<CR>", { desc = "Find buffer" })

nml("fr", "<Cmd>FzfLua history<CR>", { desc = "Find recent buffers/files" })

nml("sG", "<Cmd>FzfLua live_grep_native<CR>", { desc = "Search text (cwd)" })
nml("sR", "<Cmd>FzfLua resume<CR>", { desc = "Resume last picker" })
nml("sb", "<Cmd>FzfLua lines<CR>", { desc = "Search open buffers lines" })
nml("sg", "<Cmd>FzfLua live_grep_native<CR>", { desc = "Search text (root dir)" })
nml("sh", "<Cmd>FzfLua help_tags<CR>", { desc = "Search help pages" })
nml("sk", "<Cmd>FzfLua keymaps<CR>", { desc = "Search keymaps" })
nml("ss", "<Cmd>FzfLua lsp_document_symbols<CR>", { desc = "Search document symbols" })
nml("sw", "<Cmd>FzfLua grep_cword<CR>", { desc = "Search for word under cursor" })
xml("sw", "<Cmd>FzfLua grep_visual<CR>", { desc = "Search for current selection" })
