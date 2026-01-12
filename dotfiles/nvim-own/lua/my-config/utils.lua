local M = {}

function M.nml(suffix, rhs, opts)
	vim.keymap.set("n", "<Leader>" .. suffix, rhs, opts)
end

function M.nm(lhs, rhs, opts)
	vim.keymap.set("n", lhs, rhs, opts)
end

function M.xml(suffix, rhs, opts)
	vim.keymap.set("x", "<Leader>" .. suffix, rhs, opts)
end

function M.nmap_leader(suffix, rhs, desc)
	vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
end

function M.xmap_leader(suffix, rhs, desc)
	vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc })
end

function M.install_package(pkg_name)
	local registry = require("mason-registry")

	if not registry.is_installed(pkg_name) then
		local pkgs_to_install = {}
		table.insert(pkgs_to_install, pkg_name)

		vim.cmd("MasonInstall " .. pkg_name)
	end
end

return M
