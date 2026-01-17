local nml = require("my-config/utils").nml

-- Moving around a buffer
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

-- Moving between LSP references
require("snacks/words").enable()

vim.keymap.set({ "n", "t" }, "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })

-- Keymaps

nml("uw", function()
	vim.o.wrap = not vim.o.wrap
end, { desc = "Toggle word wrap" })

nml("bd", "<cmd>bdel<cr>", { desc = "Delete buffer" })

vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Yanky mappings

vim.keymap.set({ "x", "n" }, "<leader>p", "<cmd>YankyRingHistory<cr>", { desc = "Open Yank History" })
vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)") -- keeps cursor in the same position when yanking
-- Set these Keymaps for yank rink usage
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
-- After putting move forward and back in yank ring
vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
