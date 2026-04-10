---- statusline
--- git branch name and buffer git info
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
---

--- LSP status
local function lsp()
	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
	local texts = {}

	for _, server in pairs(clients) do
		local status = server.name .. " " .. tostring(server.initialized)

		table.insert(texts, status)
	end

	return table.concat(texts, " ")
end
---

--- macro recording info
local function recording()
	if vim.fn.reg_recording() ~= "" then
		return "%#ErrorMsg#● Recording @" .. vim.fn.reg_recording() .. "%* "
	else
		return ""
	end
end
---

--- git branch ahead/behind info
local M = {}
local ahead_behind = ""
local mini_git_updated_id

function M.on_git_status(o)
	local _, _, ab_match = string.find(o.stdout, "# branch.ab (%+%d* %-%d*)\n")

	if ab_match ~= nil and ab_match ~= "+0 -0" then
		ahead_behind = "%#MiniHipatternsFixme# " .. ab_match .. " %*"
	else
		ahead_behind = ""
		-- prevent E5560
		vim.schedule(function()
			if mini_git_updated_id then
				vim.api.nvim_del_autocmd(mini_git_updated_id)
				mini_git_updated_id = nil
			end
		end)
	end
end

function M.run_git_status_porcelain()
	vim.system({ "git", "status", "--porcelain=v2", "--branch" }, { text = true }, M.on_git_status)
end

function M.on_git_fetch(obj)
	if obj.stderr then
		return
	end

	M.run_git_status_porcelain()
end

function M.run_git_fetch()
	vim.system({ "git", "fetch" }, { text = true }, M.on_git_fetch)
end

local au_opts = { pattern = "MiniGitUpdated", callback = M.run_git_status_porcelain }

mini_git_updated_id = vim.api.nvim_create_autocmd("User", au_opts)
M.run_git_fetch()
---

MyStatusline = {}

function MyStatusline.active()
	-- `%P` shows the scroll percentage but says 'Bot', 'Top' and 'All' as well.
	return "%#Question#"
		.. git()
		.. " "
		.. vim.diagnostic.status()
		.. " "
		.. lsp()
		.. "%*%="
		.. recording()
		.. ahead_behind
		.. "%="
		.. "[%P %l:%c]"
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
