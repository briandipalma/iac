local Util = require("lazyvim.util")

local fullScreenSize = { width = 1, height = 0.95 }
local set = vim.keymap.set

-- lazygit, make it full screen, rest is the same as default
set("n", "<leader>gG", function()
	Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, size = fullScreenSize })
end, { desc = "Lazygit (root dir)" })

-- Normal mode mappings --

set("n", "<leader>fp", function()
	vim.cmd.e(vim.fn.getreg("+"))
end, { desc = "Open pasted file path" })

-- Select all
set("n", "<C-a>", "gg<S-v>G")

-- Insert mode mappings --

-- Escape without taking fingers from home row
set("i", "jk", "<Esc>")

-- Visual mode mappings --

-- Don't replace register value when pasting over text
set("v", "p", '"_dP')

-- Normal and Visual mappings --

-- Increment/Decrement
set({ "n", "v" }, "+", "<C-a>")
set({ "n", "v" }, "-", "<C-x>")
