local nm = require("my-config/utils").nm
local nml = require("my-config/utils").nml
local xml = require("my-config/utils").xml

require("gitsigns").setup({
	numhl = true,
	linehl = true,
	word_diff = true,
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		-- Navigation
		nm("]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { buffer = bufnr, desc = "Next change/hunk" })
		nm("[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { buffer = bufnr, desc = "Prev change/hunk" })

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

		-- Toggles
		nml("ub", gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle current line blame" })
		nml("uw", gitsigns.toggle_word_diff, { buffer = bufnr, desc = "Toggle word diff" })

		-- Text object
		vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { buffer = bufnr, desc = "hunk" })
	end,
})

require("gitlab").setup({
	config_path = vim.env.HOME .. "/dev/my-data/",
	attachment_dir = vim.env.HOME .. "/Pictures/Screenshots",
	reviewer_settings = {
		diffview = {
			imply_local = true,
		},
	},
	popup = {
		width = "80%",
		comment = { opacity = 0.8 },
		temp_registers = { "+" },
	},
	discussion_tree = { position = "bottom" },
	discussion_sign_and_diagnostic = {
		skip_resolved_discussion = true,
	},
})

nml("gm", function()
	require("gitlab").review()
end, { desc = "Git merge review" })
