return {
	"mfussenegger/nvim-lint",
	optional = true,
	dependencies = "mason-org/mason.nvim",
	opts = {
		linters = {
			ktlint = {
				condition = function()
					return false
				end,
			},
		},
	},
}
