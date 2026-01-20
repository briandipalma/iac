local close_callback = require("my-config/close").close_callback
local close_group = require("my-config/close").close_group
local nm = require("my-config/utils").nm
local nml = require("my-config/utils").nml
local xml = require("my-config/utils").xml

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
		nml("ub", gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle current line blame" })
		nml("ud", gitsigns.toggle_word_diff, { buffer = bufnr, desc = "Toggle word diff" })

		-- Text object
		vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { buffer = bufnr, desc = "hunk" })
	end,
})

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

vim.api.nvim_create_autocmd("User", { group = close_group, pattern = "MiniGitCommandSplit", callback = close_callback })

nml("gg", function()
	require("codediff/commands").vscode_diff({ fargs = {} })
end, { desc = "Git status diff" })

nml("gm", function()
	local on_exit = function(obj)
		local mergeBase = string.sub(obj.stdout, 1, -2)
		local fargs = { mergeBase, "HEAD" }

		-- You need to schedule this or codediff throws "fast event context" errors
		vim.schedule(function()
			require("codediff/commands").vscode_diff({ fargs = fargs })
		end)
	end

	vim.system({ "git", "merge-base", "origin/HEAD", "HEAD" }, { text = true }, on_exit)
end, { desc = "Git merge review" })

nml("gp", function()
	vim.cmd("Git pull --rebase=true")
end, { desc = "Git pull (--rebase=true)" })

nml("gc", function()
	vim.cmd("Git commit --verbose")
end, { desc = "Git commit" })

nml("gs", function()
	vim.cmd("Git fetch")
	vim.cmd("Git status")
end, { desc = "Git commit" })

nml("gf", "<CMD>FzfLua git_bcommits<CR>", { desc = "Git current file history" })
