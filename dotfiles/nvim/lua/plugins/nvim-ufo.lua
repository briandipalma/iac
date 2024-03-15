return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	opts = {
		close_fold_kinds_for_ft = {
			typescript = { "imports", "comment" },
			typescriptreact = { "imports", "comment" },
		},
	},
}
