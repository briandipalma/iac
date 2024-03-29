return {
	"mbbill/undotree",
	config = function()
		vim.api.nvim_set_var("undotree_WindowLayout", 4)
		vim.api.nvim_set_var("undotree_SplitWidth", 40)
		vim.api.nvim_set_var("undotree_DiffpanelHeight", 25)
		vim.api.nvim_set_var("undotree_SetFocusWhenToggle", 1)
	end,
	keys = { { "<leader>U", "<cmd>UndotreeShow<cr>", desc = "Open undotree" } },
}
