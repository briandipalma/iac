local nml = require("my-config/utils").nml

nml("du", "<Cmd>DepsUpdate<CR>", { desc = "Dependencies update" })
nml("dl", "<Cmd>DepsShowLog<CR>", { desc = "Dependencies show log" })
nml("dc", "<Cmd>DepsClean<CR>", { desc = "Dependencies clean" })
nml("ds", "<Cmd>DepsSnapSave<CR>", { desc = "Dependencies save snapshot" })
nml("dr", "<Cmd>DepsSnapLoad<CR>", { desc = "Dependencies load snapshot" })
