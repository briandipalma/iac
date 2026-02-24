local nml = require("my-config/utils").nml

---- noice
require("noice").setup({
	presets = {
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
	routes = {
		{
			-- Minimize unimportant messages
			filter = {
				event = "notify",
				any = {
					{ find = " Downloaded update for " },
					{ find = " Downloading %d+ updates" },
					{ find = "(mini.deps) (%d+/%d+) Checked out " },
				},
			},
			opts = { skip = true },
		},
		-- Show @recording messages
		{ view = "notify", filter = { event = "msg_showmode", find = "recording" } },
	},
})

nml("im", "<CMD>:Noice<CR>", { desc = "Message history" })
nml("id", "<CMD>:Noice dismiss<CR>", { desc = "Dismiss all messages" })
----

---- hipatterns
local hipatterns = require("mini.hipatterns")

hipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
----

---- Keymaps
nml("uw", function()
	vim.o.wrap = not vim.o.wrap
end, { desc = "Toggle word wrap" })
----
