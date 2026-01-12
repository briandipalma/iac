MiniDeps.add("nvim-mini/mini.starter")

local starter = require("mini.starter")
local new_section = function(name, action, section)
	return { name = name, action = action, section = section }
end

starter.setup({
	evaluate_single = true,
	items = {
		new_section("Grep text", "FzfLua live_grep", "Find"),
		new_section("Find file", "FzfLua files", "Find"),
		new_section("Recent file", "FzfLua oldfiles", "Find"),
		new_section("Session restore", [[lua require("persistence").load()]], "Session"),
		new_section("New file", "ene | startinsert", "Built-in"),
		new_section("Quit", "qa", "Built-in"),
		new_section("Dependencies update", [[lua require("my-config/utils").update_save()]], "Dependencies"),
	},
	content_hooks = {
		starter.gen_hook.adding_bullet("░ ", false),
		starter.gen_hook.aligning("center", "center"),
	},
})
