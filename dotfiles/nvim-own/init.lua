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

require("mini.deps").setup()

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
vim.o.number = true -- Print line number in front of lines
vim.o.relativenumber = true -- Relative line numbers
vim.o.signcolumn = "yes" -- Always show signcolumn (less flicker)
vim.o.updatetime = 200 -- Save swap file and trigger CursorHold
vim.o.foldlevel = 10 -- Fold nothing by default; set to 0 or 1 to fold
vim.o.winborder = "rounded" -- Use rounded borders on all floating windows
vim.o.breakindentopt = "shift:2" -- Wrapped line's beginning will be shifted to emphasize line continuation
vim.o.showbreak = "↳" -- String to put at start of wrapped lines
vim.o.linebreak = true -- Wrap lines at 'breakat' (if 'wrap' is set)
vim.o.scrolloff = 8 -- Lines of context

-- Editing
vim.o.clipboard = "unnamedplus" -- Sync with system clipboard

MiniDeps.add("b0o/schemastore.nvim")
MiniDeps.add("folke/flash.nvim")
MiniDeps.add("folke/persistence.nvim")
MiniDeps.add("folke/snacks.nvim")
MiniDeps.add("gbprod/yanky.nvim")
MiniDeps.add("j-hui/fidget.nvim")
MiniDeps.add("lewis6991/gitsigns.nvim")
MiniDeps.add("mason-org/mason.nvim")
MiniDeps.add("mfussenegger/nvim-lint")
MiniDeps.add("neovim/nvim-lspconfig")
MiniDeps.add("nvim-mini/mini.ai")
MiniDeps.add("nvim-mini/mini.clue")
MiniDeps.add("nvim-mini/mini.files")
MiniDeps.add("nvim-mini/mini.indentscope")
MiniDeps.add("nvim-mini/mini.starter")
MiniDeps.add("nvim-mini/mini.tabline")
MiniDeps.add("nvim-tree/nvim-web-devicons")
MiniDeps.add("nvim-treesitter/nvim-treesitter-context")
MiniDeps.add("rachartier/tiny-glimmer.nvim")
MiniDeps.add("rachartier/tiny-inline-diagnostic.nvim")
MiniDeps.add("rose-pine/neovim")
MiniDeps.add("stevearc/conform.nvim")
MiniDeps.add("stevearc/overseer.nvim")
MiniDeps.add({ source = "OXY2DEV/markview.nvim", depends = { "saghen/blink.cmp" } })
MiniDeps.add({ source = "esmuellert/codediff.nvim", depends = { "MunifTanjim/nui.nvim" } })
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
	checkout = "v1.8.0", -- use a release tag to download binaries check releases for latest tag
})

vim.cmd("colorscheme rose-pine")

require("mason").setup()
require("mini.ai").setup()
require("mini.indentscope").setup()
require("mini.tabline").setup()
require("nvim-web-devicons").setup()
require("overseer").setup()
require("persistence").setup()
require("tiny-glimmer").setup()
require("yanky").setup()
