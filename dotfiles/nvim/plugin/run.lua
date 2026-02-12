local nml = require("my-config/utils").nml
local overseer = require("overseer")

-- Turn off terminal use as long output lines wrap in neovim's terminal which breaks `errorformat`s
-- https://github.com/stevearc/overseer.nvim/issues/202
require("overseer").setup({ output = { use_terminal = false } })

overseer.register_template({
	name = "Lint package",
	builder = function()
		local fileDirectory = vim.fn.expand("%:h")

		return {
			cmd = { "pnpm", "lint", "--fix" },
			cwd = fileDirectory,
			components = {
				{
					"on_output_quickfix",
					close = true,
					-- This is an example error:
					--
					-- /home/briand/dev/m/FE-3215-summary-grid/caplin/fx-margin-ticket/src/summary/SummaryPricingTable.tsx
					--    7:8  error  'InformationHeader' is not defined        react/jsx-no-undef
					--    8:8  error  'SummaryInformationTable' is not defined  react/jsx-no-undef
					--    13:8  error  'Profit' is not defined                   react/jsx-no-undef
					--
					-- This was copied from https://github.com/vim/vim/blob/master/runtime/compiler/eslint.vim
					--
					errorformat = "%-P%f,%\\s%#%l:%c %# %trror  %m,%\\s%#%l:%c %# %tarning  %m,%-Q,%-G%.%#",
					open_on_match = true,
					set_diagnostics = true,
				},
				{ "on_result_diagnostics", remove_on_restart = true },
				"default",
			},
		}
	end,
	desc = "Run pnpm list --fix for current file package",
	condition = {
		filetype = { "typescript", "typescriptreact" },
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
				{
					"on_output_quickfix",
					close = true,
					-- This is an example error:
					--
					-- src/summary/SummaryPricingTable.tsx:10:30 - error TS2304: Cannot find name 'fields'.
					--
					-- 10         confirmationMessage={fields}
					--                                 ~~~~~~
					-- src/summary/SummaryPricingTable.tsx:11:29 - error TS2304: Cannot find name 'showAdjustedRates'.
					--
					-- 11         allowAdjustedRates={showAdjustedRates}
					--                                ~~~~~~~~~~~~~~~~~
					--
					-- %f:%l:%c: Captures the filename, line, and column (e.g., src/summary/SummaryPricingTable.tsx:10:30).
					-- \ -\ : Matches the literal space-dash-space separator.
					-- %trror: Captures the "e" in "error" and tells Vim this is an Error type.
					-- TS%n:: Captures the TypeScript error number (e.g., 2304) into the error number field.
					-- %m: Captures the actual error message (e.g., Cannot find name 'fields').
					-- %-G%.%#: This is the "greedy" ignore rule. Because the error information is self-contained
					-- on one line, this tells Vim to discard every other line in the output (the code snippets,
					-- the squiggles, and the "Found 4 errors" summary).
					errorformat = "%f:%l:%c - %trror TS%n: %m, %-G%.%#",
					open_on_match = true,
					set_diagnostics = true,
				},
				{ "on_result_diagnostics", remove_on_restart = true },
				"default",
			},
		}
	end,
	desc = "Run pnpm type-check for current file package",
	condition = {
		filetype = { "typescript", "typescriptreact" },
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
					-- the message (%m). \\C is \C which makes the "Error" case sensitive. The %.%# handles any
					-- leading space or/and characters e.g. **Type**Error or **Number**Error etc
					--     Error: Expected object not to have properties
					--     or
					--     TypeError: Expected object not to have properties
					errorformat = [[%E\\C%.%#Error: %m,]]
						-- The End of the multi-line error. It finds the line starting with "at UserContext" captures 
						-- the real file path (%f), the line number (%l), and the column (%c). It uses %s to consume 
						-- the rest of the line (the temp bundle path) and throw it away.
						--     at UserContext.<anonymous> (/home/briand/dev/m/FE-3870-quote-popout/caplin/fx-margin-ticket/src/@tests/toggle.test.ts:194:64 <- /tmp/ee25362db83d2b73301c2ac33610a6d0-bundle.js:209010:66)
						--     at UserContext.eval (webpack:///./src/_test-at/inputtingAllocations.test.js?:175:95)
						-- Some file paths/bundles are created by webpack so look for them first
						.. [[%Z%.%#at UserContext.%.%# (webpack:///%f?:%l:%c%s,]]
						.. [[%Z%.%#at UserContext.%.%# (%f:%l:%c %s,]]
						-- A Continuation line. If there are extra stack trace lines between the "Error" and the file
						-- path this filters them out
						-- at verifySummaryTableRow (/home/briand/dev/m...
						.. [[%C%.%#at %.%#,]]
						-- The at lines above can be quite long so they wrap into another line, filter out those 
						-- bundle lines
						.. [[%C%.%#-bundle.js%.%#,]]
						-- Anything else is probably part of the error message, add it to %m, consume leading white
						.. [[%C %#%m,]]
						-- A catch-all to ignore any other lines that don't match our specific pattern, keeping the
						-- quickfix window clean.
						.. [[%-G%.%#]],
					open_on_match = true,
					set_diagnostics = true,
				},
				{ "on_result_diagnostics", remove_on_restart = true },
			},
		}
	end,
	desc = "Run pnpm test for current file package",
	condition = {
		filetype = { "javascript", "typescript", "typescriptreact" },
		dir = "/home/briand/dev/m",
	},
})

nml("rr", "<cmd>OverseerRun<cr>", { desc = "Run task" })
nml("ra", "<cmd>OverseerTaskAction<cr>", { desc = "Run task action" })
