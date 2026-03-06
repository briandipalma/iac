local nml = require("my-config/utils").nml
local treesitter = require("nvim-treesitter")
local context = require("treesitter-context")

context.setup({ max_lines = 3 })
treesitter.install({ "comment" })

nml("it", "<Cmd>InspectTree<CR>", { desc = "Treesitter tree" })
nml("iT", "<Cmd>Inspect<CR>", { desc = "Treesitter node under cursor" })
