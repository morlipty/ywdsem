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
		-- lists current open buffers
		require("mini.tabline").setup({})
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
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"fzf",
				"help",
				"lazy",
				"mason",
				"notify",
				"snacks_dashboard",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "SnacksDashboardOpened",
			callback = function(data)
				vim.b[data.buf].miniindentscope_disable = true
			end,
		})
	end,
}
