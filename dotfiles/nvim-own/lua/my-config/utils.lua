local M = {}

function M.update_save()
	require("mini.deps").update()
	require("mini.deps").snap_save()
end

function M.nmap_leader(suffix, rhs, desc)
	vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
end

function M.xmap_leader(suffix, rhs, desc)
	vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc })
end

return M
