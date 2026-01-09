-- General ====================================================================
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " " -- Use `<Space>` as <Leader> key
vim.g.loaded_node_provider = 0 -- Disable Node.js remote plugins support
vim.g.loaded_perl_provider = 0 -- Disable Perl remote plugins support
vim.g.loaded_python3_provider = 0 -- Disable Python remote plugins support
vim.g.loaded_ruby_provider = 0 -- Disable Ruby remote plugins support
vim.o.undofile = true -- Enable undofiles

-- UI =========================================================================
vim.o.cursorline = true -- Enable current line highlighting
vim.o.relativenumber = true -- Relative line numbers
vim.o.signcolumn = "yes" -- Always show signcolumn (less flicker)
