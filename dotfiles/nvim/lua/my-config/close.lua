local M = {}

M.close_group = vim.api.nvim_create_augroup("close_with_q", { clear = true })

function M.close_callback(event)
	vim.bo[event.buf].buflisted = false
	vim.schedule(function()
		vim.keymap.set("n", "q", function()
			vim.cmd("close")
			pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
		end, {
			buffer = event.buf,
			silent = true,
			desc = "Quit buffer",
		})
	end)
end

return M
