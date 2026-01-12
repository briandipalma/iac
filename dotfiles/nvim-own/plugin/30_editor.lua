MiniDeps.add("nvim-tree/nvim-web-devicons")
MiniDeps.add("folke/flash.nvim")
MiniDeps.add("nvim-mini/mini.tabline")
MiniDeps.add("folke/persistence.nvim")

vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

require("persistence").setup()
require("mini.tabline").setup()
require("nvim-web-devicons").setup()
