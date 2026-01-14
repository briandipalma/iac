local nm = require("my-config/utils").nm
local nml = require("my-config/utils").nml
local xml = require("my-config/utils").xml

require("gitsigns").setup({
	numhl = true,
	word_diff = true,
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

		nml("hd", gitsigns.diffthis, { buffer = bufnr, desc = "Diff this buffer with index" })

		nml("hD", function()
			gitsigns.diffthis("~")
		end, { buffer = bufnr, desc = "Diff this buffer with ~" })

		nml("hQ", function()
			gitsigns.setqflist("all")
		end, { buffer = bufnr, desc = "Set quickfix list with all changes" })
		nml("hq", gitsigns.setqflist, { buffer = bufnr, desc = "Set quickfix list with buffer changes" })

		local bufname = vim.api.nvim_buf_get_name(bufnr)

		-- Only add `q` keymap in a `gitsigns` buffer
		if bufname:find("^gitsigns://") then
			vim.keymap.set("n", "q", function()
				for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
					if vim.api.nvim_win_get_buf(win) == bufnr then
						vim.api.nvim_win_close(win, true)
					end
				end
			end, { buffer = bufnr, desc = "Close gitsigns diff" })
		end

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

nml("gm", function()
	require("codediff/commands").vscode_diff({ fargs = { "master" } })
end, { desc = "Git merge review" })
