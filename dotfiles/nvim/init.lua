---- Options
-- General ====================================================================
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " " -- Use `<Space>` as <Leader> key
vim.g.loaded_node_provider = 0 -- Disable Node.js remote plugins support
vim.g.loaded_perl_provider = 0 -- Disable Perl remote plugins support
vim.g.loaded_python3_provider = 0 -- Disable Python remote plugins support
vim.g.loaded_ruby_provider = 0 -- Disable Ruby remote plugins support

vim.o.autowriteall = true -- Enable auto write, so you can make a change and switch buffer without "E37: ..."
vim.o.breakindentopt = "shift:2" -- Wrapped line's beginning will be shifted to emphasize line continuation
vim.o.clipboard = "unnamedplus" -- Sync with system clipboard
vim.o.cursorline = true -- Enable current line highlighting
vim.o.foldlevel = 10 -- Fold nothing by default; set to 0 or 1 to fold
vim.o.hidden = false -- Unload abandoned buffers, removes `[No Name]` buffers
vim.o.ignorecase = true -- Ignore case during search
vim.o.laststatus = 3 -- global statusline, cleans up UI, shows what you are focused on
vim.o.linebreak = true -- Wrap lines at characters in 'breakat' (if 'wrap' is set)
vim.o.number = true -- Print line number in front of lines
vim.o.relativenumber = true -- Relative line numbers
vim.o.scrolloff = 999 -- Lines of context
vim.o.sessionoptions = "buffers,curdir,folds,tabpages,winsize,terminal" -- Don't save blank/empty windows, help in sessions
vim.o.showbreak = "↳" -- String to put at start of wrapped lines
vim.o.signcolumn = "yes" -- Always show signcolumn (less flicker)
vim.o.smartcase = true -- Respect case if search pattern has upper case
vim.o.splitbelow = true -- Put new windows below current
vim.o.tabstop = 2 -- Number of spaces tabs show as, stylua uses tabs by default and 8 is too much
vim.o.undofile = true -- Enable undofiles for persistent undo
vim.o.updatetime = 200 -- Save swap file and trigger CursorHold
vim.o.winborder = "rounded" -- Use rounded borders on all floating windows
----

---- Keymaps
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

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	"https://github.com/MagicDuck/grug-far.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/OXY2DEV/markview.nvim",
	"https://github.com/b0o/SchemaStore.nvim",
	"https://github.com/esmuellert/codediff.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/folke/persistence.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/folke/ts-comments.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/gbprod/yanky.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/mfussenegger/nvim-lint",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-mini/mini-git",
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/nvim-mini/mini.files",
	"https://github.com/nvim-mini/mini.hipatterns",
	"https://github.com/nvim-mini/mini.indentscope",
	"https://github.com/nvim-mini/mini.move",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.starter",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.tabline",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/rachartier/tiny-cmdline.nvim",
	"https://github.com/rachartier/tiny-glimmer.nvim",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/rose-pine/neovim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/stevearc/overseer.nvim",
	"https://github.com/windwp/nvim-ts-autotag",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
})

vim.cmd("colorscheme rose-pine")

require("mason").setup()
require("mini.ai").setup()
require("mini.git").setup()
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.tabline").setup()
require("nvim-ts-autotag").setup()
require("nvim-web-devicons").setup()
require("persistence").setup()
require("snacks").setup()
require("tiny-glimmer").setup()
require("ts-comments").setup()
require("yanky").setup()
