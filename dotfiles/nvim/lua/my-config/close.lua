local M = {}

M.close_group = vim.api.nvim_create_augroup("close_with_q", { clear = false })

local function close_on_q(event, isTab)
	vim.bo[event.buf].buflisted = false -- buffer does not show up in buffer list

	vim.keymap.set("n", "q", function()
		if isTab then
			vim.cmd("tabclose")
		else
			vim.cmd("close")
			pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
		end
	end, {
		buffer = event.buf,
		silent = true,
		desc = "Quit buffer",
	})
end

function M.close_callback(event)
	close_on_q(event)
end

function M.close_tab_callback(event)
	close_on_q(event, true)
end

return M
