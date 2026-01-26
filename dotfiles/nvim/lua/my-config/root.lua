return function()
	local currentBufferPath = vim.uv.fs_realpath(vim.api.nvim_buf_get_name(0))
	local packageRoot = vim.fs.find(
		{ "package.json" },
		{ path = currentBufferPath, upward = true, stop = vim.uv.cwd() }
	)

	return vim.fn.fnamemodify(packageRoot[1], ":h") or vim.uv.cwd()
end
