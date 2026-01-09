--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_node_provider = 0 -- Disable Node.js remote plugins support
vim.g.loaded_perl_provider = 0 -- Disable Perl remote plugins support
vim.g.loaded_python3_provider = 0 -- Disable Python remote plugins support
vim.g.loaded_ruby_provider = 0 -- Disable Ruby remote plugins support

local opt = vim.opt

opt.relativenumber = true -- Relative line numbers
opt.undofile = true -- Enable undofiles
