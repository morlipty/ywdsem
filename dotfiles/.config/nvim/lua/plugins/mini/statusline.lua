return function()
	local statusline = require("mini.statusline")
	statusline.setup({
		content = { active = active },
	})
end
