local set = vim.keymap.set

-- Normal mode mappings --

set("n", "<leader>fp", function()
	vim.cmd.e(vim.fn.getreg("+"))
end, { desc = "Open Pasted File Path" })

-- Select all
set("n", "<C-a>", "gg<S-v>G")

-- Visual mode mappings --

-- Don't replace register value when pasting over text
set("x", "p", '"_dP')

-- Normal and Visual mappings --

-- Increment/Decrement
set({ "n", "v" }, "+", "<C-a>")
set({ "n", "v" }, "-", "<C-x>")
