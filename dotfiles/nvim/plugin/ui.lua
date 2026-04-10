local nml = require("my-config/utils").nml

---- indentscope
--- `try_as_border` placing cursor on function header will set scope to the function body
require("mini.indentscope").setup({ options = { try_as_border = true } })
----

---- ui2
require("vim._core.ui2").enable({})
----

---- tiny-cmdline
require("tiny-cmdline").setup({
	native_types = {},
	on_reposition = require("tiny-cmdline").adapters.blink,
})
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
nml("ii", "<CMD>:Inspect<CR>", { desc = "Show all the items at buffer position" })
nml("im", "<CMD>:messages<CR>", { desc = "Message history" })
----
