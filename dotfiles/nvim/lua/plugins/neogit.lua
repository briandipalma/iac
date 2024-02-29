local async = require("plenary.async")

local function neogit_action(popup, action, args)
	return function()
		local popup_action = require("neogit.popups." .. popup .. ".actions")[action]
		local fake_popup = {
			get_arguments = function()
				return args
			end,
		}

		async.run(function()
			popup_action(fake_popup)
		end, function() end)
	end
end

return {
	"NeogitOrg/neogit",
	dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
	cmd = "Neogit",
	config = true,
	opts = {
		-- Enter insert mode if no commit message
		disable_insert_on_commit = "auto",
		use_per_project_settings = false,
		-- Persist force with lease
		ignored_settings = {},
		popup = {
			kind = "split_above",
		},
	},
	keys = {
		{
			"<leader>gg",
			function()
				local neogit = require("neogit")

				neogit.open()
			end,
			desc = "Neogit",
		},
		{
			"<leader>gc",
			neogit_action("commit", "commit", { "--verbose" }),
			desc = "Commit staged changes",
		},
		{
			"<leader>ga",
			neogit_action("commit", "amend", { "--no-edit" }),
			desc = "Amend commit, no message edit",
		},
		{
			"<leader>gs",
			function()
				local neogit = require("neogit")

				neogit.open({})
				neogit.open({ "stash" })
			end,
			desc = "Stashes popup",
		},
		{
			"<leader>gr",
			function()
				local neogit = require("neogit")

				neogit.open({})
				neogit.open({ "rebase" })
			end,
			desc = "Rebase",
		},
		{
			"<leader>gp",
			function()
				local neogit = require("neogit")

				neogit.open({})
				neogit.open({ "push" })
			end,
			desc = "Push changes",
		},
	},
}
