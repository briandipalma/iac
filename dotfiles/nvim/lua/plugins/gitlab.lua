return {
	"harrisoncramer/gitlab.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"stevearc/dressing.nvim",
		"nvim-tree/nvim-web-devicons",
		enabled = true,
	},
	lazy = false,
	build = function()
		if vim.fn.executable("go") == 1 then
			require("gitlab.server").build(true)
		end
	end,
	config = function()
		local config = {
			config_path = "/home/brian/dev/my-data/",
			attachment_dir = "/home/brian/Pictures/Screenshots",
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
		}

		if vim.fn.executable("go") == 1 then
			require("gitlab").setup(config)
		end
	end,
	keys = {
		{
			"<leader>mm",
			function()
				require("gitlab").review()
			end,
			desc = "Review Gitlab MR",
		},
	},
}
