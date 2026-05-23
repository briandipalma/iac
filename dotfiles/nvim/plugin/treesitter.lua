local nml = require("my-config/utils").nml
local arborist = require("arborist")
local context = require("treesitter-context")

context.setup({ max_lines = 3 })
arborist.setup({ ensure_installed = { "comment" }, install_popular = false, prefer_wasm = false })

nml("it", "<Cmd>InspectTree<CR>", { desc = "Treesitter tree" })
