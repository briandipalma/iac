local nml = require("my-config/utils").nml
local overseer = require("overseer")

overseer.register_template({
	name = "Lint package",
	builder = function()
		local fileDirectory = vim.fn.expand("%:h")

		return {
			cmd = { "pnpm", "lint", "--fix" },
			cwd = fileDirectory,
			components = { { "on_output_quickfix", open = true }, "default" },
		}
	end,
	desc = "Run pnpm list --fix for current file package",
	condition = {
		filetype = { "typescript" },
		dir = "/home/briand/dev/m",
	},
})

overseer.register_template({
	name = "Type check package",
	builder = function()
		local fileDirectory = vim.fn.expand("%")
		local project_root = string.gsub(fileDirectory, "/src/.*", "")

		return {
			cmd = { "pnpm", "type-check" },
			cwd = project_root,
			components = { { "on_output_quickfix", open = true }, "default" },
		}
	end,
	desc = "Run pnpm type-check for current file package",
	condition = {
		filetype = { "typescript" },
		dir = "/home/briand/dev/m",
	},
})

nml("rr", "<cmd>OverseerRun<cr>", { desc = "Run task" })
