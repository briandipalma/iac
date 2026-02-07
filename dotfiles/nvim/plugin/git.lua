local close_tab_callback = require("my-config/close").close_tab_callback
local close_group = require("my-config/close").close_group
local nm = require("my-config/utils").nm
local nml = require("my-config/utils").nml
local xml = require("my-config/utils").xml

---- gitsigns
require("gitsigns").setup({
	numhl = true,
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		-- Navigation
		local lifecycle = require("codediff.ui.lifecycle")
		local tabpage = lifecycle.find_tabpage_by_buffer(bufnr)

		-- Don't add navigation keymaps to codediff/diff buffers, they have their own hunk navigation
		if not tabpage and not vim.wo.diff then
			nm("]c", function()
				gitsigns.nav_hunk("next")
			end, { buffer = bufnr, desc = "Next hunk" })
			nm("[c", function()
				gitsigns.nav_hunk("prev")
			end, { buffer = bufnr, desc = "Prev hunk" })
		end

		-- Actions
		nml("hs", gitsigns.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
		xml("hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { buffer = bufnr, desc = "Stage hunk" })

		nml("hr", gitsigns.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
		xml("hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { buffer = bufnr, desc = "Reset hunk" })

		nml("hS", gitsigns.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
		nml("hR", gitsigns.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
		nml("hp", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
		nml("hi", gitsigns.preview_hunk_inline, { buffer = bufnr, desc = "Preview hunk inline" })

		nml("hb", function()
			gitsigns.blame_line({ full = true })
		end, { buffer = bufnr, desc = "Blame line" })

		-- Toggles
		nml("gb", gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle current line blame" })
		nml("hw", gitsigns.toggle_word_diff, { buffer = bufnr, desc = "Toggle word diff" })

		-- Text object
		vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { buffer = bufnr, desc = "hunk" })
	end,
})
----

---- codediff
require("codediff").setup({
	diff = { disable_inlay_hints = false },
	explorer = { position = "bottom" },
	keymaps = {
		view = {
			next_file = "<Tab>", -- Next file in explorer mode
			prev_file = "<S-Tab>", -- Previous file in explorer mode
		},
	},
})

nml("gg", "<CMD>:CodeDiff<CR>", { desc = "Git status diff" })
nml("gf", "<CMD>:CodeDiff history %<CR>", { desc = "Git current file log" })
nml("gl", "<CMD>:CodeDiff history<CR>", { desc = "Git log" })
-- No righthand side to the `...` operator means the current files are used on the right side and
-- LSP/linting is active so you can spot type/linting errors and open the file with `gf` it also
-- means your local changes will show up in the review.
nml("gm", "<CMD>:CodeDiff origin/HEAD...<CR>", { desc = "Git merge review" })
----

---- mini.git
nml("gp", "<CMD>:Git pull --rebase=true<CR>", { desc = "Git pull (--rebase=true)" })
nml("gc", "<CMD>:Git commit --verbose<CR>", { desc = "Git commit" })
nml("ga", "<CMD>:Git commit --amend --verbose<CR>", { desc = "Git amend" })
nml("gu", "<CMD>:Git push --force-with-lease --force-if-includes<CR>", { desc = "Git push --force-if-includes" })
xml("gv", function()
	require("mini.git").show_range_history()
end, { desc = "Git history of selection" })

nml("gs", function()
	vim.cmd("Git fetch")
	vim.cmd("Git status")
	vim.cmd("bo horizontal Git log -5 --decorate=full --format=short")
end, { desc = "Git status" })
----

---- Utility
-- close some ephemeral git filetypes/buffers with <q>
vim.api.nvim_create_autocmd(
	"User",
	{ group = close_group, pattern = "MiniGitCommandSplit", callback = close_tab_callback }
)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "git", "gitcommit" },
	group = close_group,
	callback = close_tab_callback,
})
----
