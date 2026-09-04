local context = require("treesitter-context")
local nml = require("my-config/utils").nml
local treesitter = require("nvim-treesitter")

treesitter.install({ "comment", "diff", "git_rebase", "javadoc", "jsdoc", "regex" })

context.setup({ max_lines = 3 })

nml("it", "<Cmd>InspectTree<CR>", { desc = "Treesitter tree" })
