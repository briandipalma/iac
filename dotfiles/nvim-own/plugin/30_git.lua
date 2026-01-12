local nmap_leader = require("my-config/utils").nmap_leader
local nml = require("my-config/utils").nml
local xmap_leader = require("my-config/utils").xmap_leader

MiniDeps.add("lewis6991/gitsigns.nvim")

require("gitsigns").setup({
	numhl = true,
	linehl = true,
	word_diff = true,
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")
		local m = vim.keymap.set

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		m("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { buffer = bufnr, desc = "Next change/hunk" })

		m("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { buffer = bufnr, desc = "Prev change/hunk" })

		-- Actions
		nml("hs", gitsigns.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
		xmap_leader("hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, "Stage hunk")

		nmap_leader("hr", gitsigns.reset_hunk, "Reset hunk")
		map("v", "<leader>hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		map("n", "<leader>hS", gitsigns.stage_buffer)
		map("n", "<leader>hR", gitsigns.reset_buffer)
		map("n", "<leader>hp", gitsigns.preview_hunk)
		map("n", "<leader>hi", gitsigns.preview_hunk_inline)

		map("n", "<leader>hb", function()
			gitsigns.blame_line({ full = true })
		end)

		map("n", "<leader>hd", gitsigns.diffthis)

		map("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end)

		map("n", "<leader>hQ", function()
			gitsigns.setqflist("all")
		end)
		map("n", "<leader>hq", gitsigns.setqflist)

		-- Toggles
		map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
		map("n", "<leader>tw", gitsigns.toggle_word_diff)

		-- Text object
		map({ "o", "x" }, "ih", gitsigns.select_hunk)
	end,
})

MiniDeps.add({
	source = "harrisoncramer/gitlab.nvim",
	depends = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"stevearc/dressing.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	hooks = {
		post_checkout = function()
			if vim.fn.executable("go") == 1 then
				require("gitlab.server").build(true)
			end
		end,
	},
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

nmap_leader("gm", function()
	require("gitlab").review()
end, "Git merge review")
