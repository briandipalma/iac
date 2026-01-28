local nml = require("my-config/utils").nml
local close_callback = require("my-config/close").close_callback
local close_group = require("my-config/close").close_group

---- flash - moving around a buffer
require("flash").setup({ modes = { search = { enabled = true } } })

vim.keymap.set({ "n", "x", "o" }, "f", function()
	require("flash").jump()
end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "F", function()
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
----

---- snacks/words - moving between LSP references
local snackWords = require("snacks/words")

snackWords.enable()

vim.keymap.set({ "n", "t" }, "]]", function()
	snackWords.jump(vim.v.count1)
end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "[[", function()
	snackWords.jump(-vim.v.count1)
end, { desc = "Prev Reference" })
----

---- Yanky - better yank/put
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
----

---- Undotree
nml("U", "<cmd>lua require('undotree').toggle()<cr>", { desc = "Undotree toggle" })

---- Utility
-- close some ephemeral filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "checkhealth", "qf", "help", "lspinfo" },
	group = close_group,
	callback = close_callback,
})
----

---- Keymaps
-- Move to window using the <ctrl> hjkl keys
-- The default mappings are useless apart from `C-l` but window movement is far most useful
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" }) -- Default `C-h` is just `h`
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" }) -- Default just `j`
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" }) -- No default ¯\_(ツ)_/¯
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" }) -- Clears highlights

vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

nml("qq", "<cmd>qa<cr>", { desc = "Quit All/Exit Neovim" }) -- Exit vim unless there are modified buffers

nml("bd", function()
	-- Delete buffers without disrupting window layout
	require("snacks/bufdelete").delete()
end, { desc = "Delete buffer" })
nml("bo", function()
	require("snacks/bufdelete").other()
end, { desc = "Delete other buffers" })
----
