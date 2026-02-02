local nml = require("my-config/utils").nml
local overseer = require("overseer")

overseer.register_template({
	name = "Lint package",
	builder = function()
		local fileDirectory = vim.fn.expand("%:h")

		return {
			cmd = { "pnpm", "lint", "--fix" },
			cwd = fileDirectory,
			components = {
				{ "on_output_quickfix", close = true, open_on_match = true, set_diagnostics = true },
				{ "on_result_diagnostics", remove_on_restart = true },
				"default",
			},
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
			components = {
				{ "on_output_quickfix", close = true, open_on_match = true, set_diagnostics = true },
				{ "on_result_diagnostics", remove_on_restart = true },
				"default",
			},
		}
	end,
	desc = "Run pnpm type-check for current file package",
	condition = {
		filetype = { "typescript" },
		dir = "/home/briand/dev/m",
	},
})

overseer.register_template({
	name = "Test package",
	builder = function()
		local fileDirectory = vim.fn.expand("%")
		local project_root = string.gsub(fileDirectory, "/src/.*", "")

		return {
			cmd = { "pnpm", "test" },
			cwd = project_root,
			env = { CI = "true" },
			components = {
				"default",
				{
					"on_output_quickfix",
					-- Close the quickfix on completion if no errorformat matches
					close = true,
					-- This is an example error:
					--
					-- Error: Expected object not to have properties
					--     tradeState: 'Executable'
					--     at <Jasmine>
					--     at UserContext.<anonymous> (/home/briand/dev/m/FE-3870-quote-popout/caplin/fx-margin-ticket/src/@tests/toggle.test.ts:194:64 <- /tmp/ee25362db83d2b73301c2ac33610a6d0-bundle.js:209010:66)
					--
					-- The Start of an error. It looks for the word "Error:" and captures everything after it as
					-- the message (%m). The \%# handles any leading whitespace.
					--     Error: Expected object not to have properties
					errorformat = "%E %#Error: %m,"
						-- The End of the multi-line error. It finds the line starting with "at", captures the real 
						-- file path (%f), the line number (%l), and the column (%c). It uses %s to consume the rest 
						-- of the line (the temp bundle path) and throw it away.
						--     at UserContext.<anonymous> (/home/briand/dev/m/FE-3870-quote-popout/caplin/fx-margin-ticket/src/@tests/toggle.test.ts:194:64 <- /tmp/ee25362db83d2b73301c2ac33610a6d0-bundle.js:209010:66)
						.. " %Z %#at %.%# (%f:%l:%c <- %s,"
						-- A Continuation line. If there are extra lines between the "Error" and the file path this 
						-- captures them and appends them to the error message.
						--     tradeState: 'Executable'
						.. " %C %#%m,"
						-- Ignore lines that just say <Jasmine>
						--     at <Jasmine>
						.. " %-G %#at <Jasmine>,"
						-- A catch-all to ignore any other lines that don't match our specific pattern, keeping the 
						-- quickfix window clean.
						.. " %-G%.%#",
					open_on_match = true,
					set_diagnostics = true,
				},
				{ "on_result_diagnostics", remove_on_restart = true },
			},
		}
	end,
	desc = "Run pnpm test for current file package",
	condition = {
		filetype = { "typescript" },
		dir = "/home/briand/dev/m",
	},
})

nml("rr", "<cmd>OverseerRun<cr>", { desc = "Run task" })
