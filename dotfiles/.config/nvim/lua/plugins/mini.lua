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
		-- jump by pressing enter
		require("mini.jump2d").setup({})
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
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
			},
		})
		-- indentscope
		require("mini.indentscope").setup({
			options = {
				try_as_border = true,
			},
			symbol = "│",
		})
		-- autopairs
		require("mini.pairs").setup({
			modes = { insert = true, command = true, terminal = false },
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			skip_ts = { "string" },
			skip_unbalanced = true,
			markdown = true,
		})
		-- hints
		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },

				-- mini.bracketed
				{ mode = "n", keys = "]" },
				{ mode = "n", keys = "[" },
				{ mode = "x", keys = "]" },
				{ mode = "x", keys = "[" },

				-- mini.surrond
				{ mode = "n", keys = "s" },

				-- mini.ai
				{ mode = "v", keys = "a" },
				{ mode = "v", keys = "i" },
			},
			window = {
				delay = 500,
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.square_brackets(),
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
		})
	end,
}
