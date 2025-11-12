return {
	"nvim-mini/mini.nvim",

	version = false,
	init = function()
		require("plugins.mini._autocmds")()
	end,

	config = function()
		for _, m in ipairs({
			"ai",
			"align",
			"bracketed",
			"bufremove",
			-- "clue",
			"cursorword",
			"diff",
			"hipatterns",
			"icons",
			"indentscope",
			"move",
			"notify",
			-- "pairs",
			"sessions",
			"splitjoin",
			"starter",
			-- "statusline",
			"surround",
			"tabline",
		}) do
			require("plugins.mini." .. m)()
		end
	end,
}
