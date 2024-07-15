return {
	"folke/which-key.nvim",
	opts = function()
		local which_key = require("which-key")

		which_key.add({ "<leader>d", group = "diff" })
		which_key.add({ "<leader>m", group = "merge request" })
	end,
}
