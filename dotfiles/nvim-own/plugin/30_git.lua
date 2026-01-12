local nmap_leader = require("my-config/utils").nmap_leader

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
