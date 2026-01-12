MiniDeps.add("folke/flash.nvim")
MiniDeps.add("folke/persistence.nvim")
MiniDeps.add("nvim-mini/mini.tabline")
MiniDeps.add("nvim-tree/nvim-web-devicons")

require("flash").setup({ modes = { search = { enabled = true } } })

vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash treesitter" })
-- When in yank operator pending mode yank text that is remote from cursor e.g. `yr...`
vim.keymap.set("o", "r", function()
	require("flash").remote()
end, { desc = "Remote flash" })
-- When in yank operator pending mode yank treesitter nodes that are remote from cursor e.g. `yR...`
vim.keymap.set({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

require("mini.tabline").setup()
require("nvim-web-devicons").setup()
require("persistence").setup()
