---- statusline
local function git()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end

	local head = git_info.head
	local added = git_info.added and (" +" .. git_info.added) or ""
	local changed = git_info.changed and (" ~" .. git_info.changed) or ""
	local removed = git_info.removed and (" -" .. git_info.removed) or ""
	if git_info.added == 0 then
		added = ""
	end
	if git_info.changed == 0 then
		changed = ""
	end
	if git_info.removed == 0 then
		removed = ""
	end

	return table.concat({
		"[ ", -- branch icon
		head,
		added,
		changed,
		removed,
		"]",
	})
end

local function recording()
	if vim.fn.reg_recording() ~= "" then
		return "%#ErrorMsg#Recording @" .. vim.fn.reg_recording() .. "%* "
	else
		return ""
	end
end

MyStatusline = {}

function MyStatusline.active()
	-- `%P` shows the scroll percentage but says 'Bot', 'Top' and 'All' as well.
	return "%#Question#" .. git() .. "%*%=" .. recording() .. "%{mode()}" .. "%=" .. "[%P %l:%c]"
end
----

---- winbar
local function filepath()
	-- Modify the given file path with the given modifiers
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")

	if fpath == "" or fpath == "." then
		return ""
	end

	return string.format("%%<%s/", fpath)
	-- `%%` -> `%`.
	-- `%s` -> value of `fpath`.
	-- The result is `%<fpath/`.
	-- `%<` tells where to truncate when there is not enough space.
end

MyWinbar = {}

function MyWinbar.active()
	-- `%P` shows the scroll percentage but says 'Bot', 'Top' and 'All' as well.
	return " → " .. filepath() .. "%t %y"
end

function MyWinbar.inactive()
	return " %t"
end
----

local group = vim.api.nvim_create_augroup("MyBars", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = group,
	desc = "Activate bars on focus",
	callback = function()
		vim.o.winbar = "%!v:lua.MyWinbar.active()"
		vim.o.statusline = "%!v:lua.MyStatusline.active()"
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = group,
	desc = "Deactivate bars when unfocused",
	callback = function()
		vim.o.winbar = "%!v:lua.MyWinbar.inactive()"
	end,
})
