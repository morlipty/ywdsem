return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		-- a(round) i(inside) textobjects
		require("mini.ai").setup({})
		-- icons
		require("mini.icons").setup({})
		-- cursor under current word
		require("mini.cursorword").setup({})
		-- git hunks
		require("mini.diff").setup({})
		-- animations
		require("mini.animate").setup({
			cursor = { enable = false },
		})
		-- lists current open buffers
		require("mini.tabline").setup({})
		-- for testing plugins
		require("mini.test").setup({})
		-- go -> <- via square brackets
		require("mini.bracketed").setup({})
		-- surround with character
		require("mini.surround").setup({})
		-- split and join arguments
		require("mini.splitjoin").setup({})
		-- move selection
		require("mini.move").setup({})
		-- sessions
		require("mini.sessions").setup({})
		-- starter config
		local starter = require("mini.starter")
		starter.setup({
			items = {
				starter.sections.builtin_actions(),
				starter.sections.recent_files(10, false),
				starter.sections.recent_files(10, true),
				-- Use this if you set up 'mini.sessions'
				starter.sections.sessions(5, true),
			},
			content_hooks = {
				starter.gen_hook.adding_bullet(),
				starter.gen_hook.indexing("all", { "Builtin actions" }),
				starter.gen_hook.padding(3, 2),
				starter.gen_hook.aligning("center", "center"),
			},
		})
		-- highlight patterns in page
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = {
					pattern = "%f[%w]()FIXME()%f[%W]",
					group = "MiniHipatternsFixme",
					extmark_opts = {
						sign_text = " ",
						sign_hl_group = "DiagnosticError",
					},
				},
				hack = {
					pattern = "%f[%w]()HACK()%f[%W]",
					group = "MiniHipatternsHack",
					extmark_opts = {
						sign_text = " ",
						sign_hl_group = "DiagnosticWarn",
					},
				},
				todo = {
					pattern = "%f[%w]()TODO()%f[%W]",
					group = "MiniHipatternsTodo",
					extmark_opts = {
						sign_text = " ",
						sign_hl_group = "DiagnosticInfo",
					},
				},
				note = {
					pattern = "%f[%w]()NOTE()%f[%W]",
					group = "MiniHipatternsNote",
					extmark_opts = {
						sign_text = " ",
						sign_hl_group = "DiagnosticHint",
					},
				},
			},
		})
		-- indentscope
		require("mini.indentscope").setup({
			options = {
				try_as_border = true,
			},
			symbol = "│",
		})
	end,
}
