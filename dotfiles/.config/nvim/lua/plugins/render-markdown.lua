return {
	"MeanderingProgrammer/render-markdown.nvim",

	config = function()
		local rednder_markdown = require("render-markdown")
		rednder_markdown.setup({
			completions = { lsp = { enabled = true } },
		})
	end,
}
