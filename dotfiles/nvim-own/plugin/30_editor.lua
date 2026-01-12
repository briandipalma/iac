MiniDeps.add("folke/flash.nvim")
MiniDeps.add("folke/persistence.nvim")
MiniDeps.add("nvim-mini/mini.tabline")
MiniDeps.add("nvim-tree/nvim-web-devicons")

vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

require("mini.tabline").setup()
require("nvim-web-devicons").setup()
require("persistence").setup()
