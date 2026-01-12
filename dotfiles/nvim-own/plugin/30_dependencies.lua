local nmap_leader = require("my-config/utils").nmap_leader

nmap_leader("du", "<Cmd>DepsUpdate<CR>", "Dependencies update")
nmap_leader("dl", "<Cmd>DepsShowLog<CR>", "Dependencies show log")
nmap_leader("dc", "<Cmd>DepsClean<CR>", "Dependencies clean")
nmap_leader("ds", "<Cmd>DepsSnapSave<CR>", "Dependencies save snapshot")
nmap_leader("dr", "<Cmd>DepsSnapLoad<CR>", "Dependencies load snapshot")
