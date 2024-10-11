local augroup = vim.api.nvim_create_augroup("tsc-make", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescript,typescriptreact",
	group = augroup,
	callback = function(args)
		local project_root = string.gsub(args.file, "/src/.*", "")

		vim.cmd.compiler("tsc")
		vim.bo.makeprg = "npx tsc --project " .. project_root
	end,
})

vim.api.nvim_create_autocmd(
	{ "FocusLost", "ModeChanged", "TextChanged", "BufEnter" },
	{ desc = "autosave", pattern = "*", command = "silent! update" }
)
