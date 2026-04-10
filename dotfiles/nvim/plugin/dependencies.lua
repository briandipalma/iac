local nml = require("my-config/utils").nml

nml("du", function()
	vim.pack.update()
end, { desc = "Dependencies update" })
nml("dr", function()
	vim.pack.update(nil, { target = "lockfile" })
end, { desc = "Dependencies load lockfile" })
