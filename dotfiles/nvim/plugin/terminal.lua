local snacksTerminal = require("snacks/terminal")
local root = require("my-config/root")

vim.keymap.set("n", "<leader>tt", function()
	snacksTerminal.open(nil, { cwd = root() })
end, { desc = "Terminal (root dir)" })

vim.keymap.set("n", "<leader>tT", function()
	snacksTerminal.open()
end, { desc = "Terminal (cwd)" })
