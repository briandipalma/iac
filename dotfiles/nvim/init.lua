-- Clone 'mini.deps' in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.deps"

if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing [`mini.deps`](../doc/mini.deps.qmd#mini.deps)" | redraw')

	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/nvim-mini/mini.deps",
		mini_path,
	}

	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.deps | helptags ALL")
	vim.cmd('echo "Installed [`mini.deps`](../doc/mini.deps.qmd#mini.deps)" | redraw')
end

local MiniDeps = require("mini.deps")

MiniDeps.setup()

---- Options, some of these should be default in Neovim
-- General ====================================================================
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " " -- Use `<Space>` as <Leader> key
vim.g.loaded_node_provider = 0 -- Disable Node.js remote plugins support
vim.g.loaded_perl_provider = 0 -- Disable Perl remote plugins support
vim.g.loaded_python3_provider = 0 -- Disable Python remote plugins support
vim.g.loaded_ruby_provider = 0 -- Disable Ruby remote plugins support
vim.o.undofile = true -- Enable undofiles for persistent undo
vim.o.hidden = false -- Unload abandoned buffers, removes `[No Name]` buffers
vim.o.updatetime = 200 -- Save swap file and trigger CursorHold
vim.o.autowriteall = true -- Enable auto write, so you can make a change and switch buffer without "E37: ..."
-- Don't save blank/empty windows, help pages in sessions
vim.o.sessionoptions = "buffers,curdir,folds,tabpages,winsize,terminal"

-- UI =========================================================================
vim.o.breakindentopt = "shift:2" -- Wrapped line's beginning will be shifted to emphasize line continuation
vim.o.cursorline = true -- Enable current line highlighting
vim.o.foldlevel = 10 -- Fold nothing by default; set to 0 or 1 to fold
vim.o.laststatus = 3 -- global statusline, cleans up UI, shows what you are focused on
vim.o.linebreak = true -- Wrap lines at characters in 'breakat' (if 'wrap' is set)
vim.o.number = true -- Print line number in front of lines
vim.o.relativenumber = true -- Relative line numbers
vim.o.scrolloff = 999 -- Lines of context
vim.o.showbreak = "↳" -- String to put at start of wrapped lines
vim.o.signcolumn = "yes" -- Always show signcolumn (less flicker)
vim.o.winborder = "rounded" -- Use rounded borders on all floating windows
vim.o.splitbelow = true -- Put new windows below current
vim.o.tabstop = 2 -- Number of spaces tabs show as, stylua uses tabs by default and 8 is too much

-- Editing =========================================================================
vim.o.clipboard = "unnamedplus" -- Sync with system clipboard
vim.o.ignorecase = true -- Ignore case during search
vim.o.smartcase = true -- Respect case if search pattern has upper case
----

---- Keymaps, again some should be default in Neovim
-- Move to window using the <ctrl> hjkl keys
-- The default mappings are useless apart from `C-l` but window movement is far most useful
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" }) -- Default `C-h` is just `h`
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" }) -- Default just `j`
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" }) -- No default ¯\_(ツ)_/¯
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" }) -- Clears highlights

-- Resize window using <ctrl> arrow keys, nothing mapped to these shortcuts
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines, nothing mapped to these shortcuts
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- better up/down, handles wrapped lines correctly
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Don't replace register value when pasting over text
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without replacing unnamed register value" })
-- Clear search on escape
vim.keymap.set("n", "<esc>", function()
	vim.cmd("nohlsearch")
	return "<esc>"
end, { expr = true, desc = "Clear hlsearch and Escape" })
----

MiniDeps.add("MagicDuck/grug-far.nvim")
MiniDeps.add("b0o/schemastore.nvim")
MiniDeps.add("folke/flash.nvim")
MiniDeps.add("folke/persistence.nvim")
MiniDeps.add("folke/snacks.nvim")
MiniDeps.add("folke/ts-comments.nvim")
MiniDeps.add("folke/which-key.nvim")
MiniDeps.add("gbprod/yanky.nvim")
MiniDeps.add("jiaoshijie/undotree")
MiniDeps.add("lewis6991/gitsigns.nvim")
MiniDeps.add("mason-org/mason.nvim")
MiniDeps.add("mfussenegger/nvim-lint")
MiniDeps.add("neovim/nvim-lspconfig")
MiniDeps.add("nvim-mini/mini-git")
MiniDeps.add("nvim-mini/mini.ai")
MiniDeps.add("nvim-mini/mini.files")
MiniDeps.add("nvim-mini/mini.hipatterns")
MiniDeps.add("nvim-mini/mini.indentscope")
MiniDeps.add("nvim-mini/mini.pairs")
MiniDeps.add("nvim-mini/mini.starter")
MiniDeps.add("nvim-mini/mini.surround")
MiniDeps.add("nvim-mini/mini.tabline")
MiniDeps.add("nvim-tree/nvim-web-devicons")
MiniDeps.add("nvim-treesitter/nvim-treesitter-context")
MiniDeps.add("rachartier/tiny-glimmer.nvim")
MiniDeps.add("rachartier/tiny-inline-diagnostic.nvim")
MiniDeps.add("rose-pine/neovim")
MiniDeps.add("stevearc/conform.nvim")
MiniDeps.add("stevearc/overseer.nvim")
MiniDeps.add("windwp/nvim-ts-autotag")
MiniDeps.add({ source = "OXY2DEV/markview.nvim" })
MiniDeps.add({ source = "esmuellert/codediff.nvim" })
MiniDeps.add({ source = "folke/noice.nvim", depends = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } })
MiniDeps.add({ source = "ibhagwan/fzf-lua", depends = { "nvim-tree/nvim-web-devicons" } })
MiniDeps.add({
	source = "nvim-treesitter/nvim-treesitter",
	hooks = {
		post_checkout = function()
			vim.cmd("TSUpdate")
		end,
	},
})
MiniDeps.add({
	source = "saghen/blink.cmp",
	depends = { "rafamadriz/friendly-snippets" },
	checkout = "v1.9.1", -- use a release tag to download binaries check releases for latest tag
})

vim.cmd("colorscheme rose-pine")

require("mason").setup()
require("mini.ai").setup()
require("mini.git").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.tabline").setup()
require("nvim-ts-autotag").setup()
require("nvim-web-devicons").setup()
require("persistence").setup()
require("tiny-glimmer").setup()
require("ts-comments").setup()
require("yanky").setup()
