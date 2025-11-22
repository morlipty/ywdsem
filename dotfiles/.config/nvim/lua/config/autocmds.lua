-- Highlight text on yank
local highlight_yank_group = vim.api.nvim_create_augroup("highlight_yank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	desc = "highlight text on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 400, visual = true })
	end,
})

-- Enable Tree-sitter
local ts_group = vim.api.nvim_create_augroup("ts_highlighting_and_folding", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = ts_group,
	desc = "Enable Tree-sitter highlighting and folding when parser is available",
	callback = function(args)
		local ok = pcall(vim.treesitter.start, args.buf)

		if not ok then
			vim.opt_local.foldmethod = "manual"
			return
		end

		vim.opt_local.foldlevel = 99
		vim.opt_local.foldmethod = "expr"
		vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})

-- Close some filetypes with q
local close_with_q_group = vim.api.nvim_create_augroup("clear_with_q", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = close_with_q_group,
	pattern = {
		"notify",
		"checkhealth",
		"lspinfo",
	},

	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})
