MiniDeps.add("nvim-mini/mini.clue")

local miniclue = require("mini.clue")

miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = { "n", "x" }, keys = "<Leader>" },

		-- `[` and `]` keys
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = { "n", "x" }, keys = "g" },

		-- Marks
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },

		-- Registers
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = { "n", "x" }, keys = "z" },
	},

	clues = {
		{
			{ mode = "n", keys = "<Leader>c", desc = "+Code" },
			{ mode = "n", keys = "<Leader>d", desc = "+Dependencies" },
			{ mode = "n", keys = "<Leader>f", desc = "+Find" },
			{ mode = "n", keys = "<Leader>s", desc = "+Search" },
			{ mode = "x", keys = "<Leader>s", desc = "+Search" },
			{ mode = "n", keys = "<Leader>g", desc = "+Git" },
		},
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},

	-- Clue window settings
	window = {
		--Floating window config
		config = { width = "auto" },

		-- Delay before showing clue window
		delay = 100,
	},
})
