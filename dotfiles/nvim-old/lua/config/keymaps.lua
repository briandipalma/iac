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

-- Terminal mappings --

-- Escape from terminal mode, for fzf-lua which runs in a terminal buffer
set("t", "<M-e>", "<C-\\><C-N>")
-- Escape from terminal mode and paste the + register, for fzf-lua which runs in a terminal buffer
set("t", "<M-p>", '<C-\\><C-N>"+pi')
