return {
	"nvim-telescope/telescope.nvim",
	keys = {
		-- disable the git status keymap, neogit stash uses it
		{ "<leader>gs", false },
		-- disable the search git commits keymap, neogit commit uses it
		{ "<leader>gc", false },
		{ "<leader>dc", "<cmd>Telescope git_commits<CR>", desc = "Search all commits" },
	},
	opts = {
		defaults = {
			cache_picker = { num_pickers = 10, limit_entries = 10 },
			-- You need to set padding to 0 to make telescope take up 100% width...
			-- https://github.com/nvim-telescope/telescope.nvim/issues/2508
			layout_config = { height = 0.9, width = { padding = 0 }, vertical = { preview_height = 0.65 } },
			layout_strategy = "vertical",
			wrap_results = true,
			mappings = {
				i = {
					["<a-d>"] = function(...)
						return require("telescope.actions").delete_buffer(...)
					end,
					["<a-n>"] = require("telescope.actions.layout").cycle_layout_next,
					["<a-p>"] = require("telescope.actions.layout").cycle_layout_prev,
				},
				n = {
					["<a-d>"] = function(...)
						return require("telescope.actions").delete_buffer(...)
					end,
				},
			},
		},
		pickers = {
			live_grep = { additional_args = { "--hidden" } },
			lsp_references = { fname_width = 100 },
			lsp_definitions = { fname_width = 100 },
		},
	},
}
