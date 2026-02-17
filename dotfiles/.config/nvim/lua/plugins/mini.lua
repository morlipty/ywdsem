return {
	"nvim-mini/mini.nvim",

	version = false,

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
			"sessions",
			"splitjoin",
			"starter",
			"surround",
			"tabline",
		}) do
			require("plugins.mini." .. m)()
		end
	end,
}
