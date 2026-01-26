return {
	"piersolenski/wtf.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {},
	keys = {
		{
			mode = { "n" },
			"gw",
			function()
				require("wtf").search()
			end,
			desc = "Search diagnostic with Google",
		},
	},
}
