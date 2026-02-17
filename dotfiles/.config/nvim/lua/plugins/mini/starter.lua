return function()
	local header_art = [[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]
	local starter = require("mini.starter")
	starter.setup({
		content_hooks = {
			starter.gen_hook.adding_bullet("-> "),
			starter.gen_hook.aligning("center", "center"),
		},
		header = header_art,
		footer = "",
	})
end
