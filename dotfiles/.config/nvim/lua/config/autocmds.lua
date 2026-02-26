-- General function to create group names
local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_text_on_yank_group"),
	callback = function()
		vim.hl.on_yank({ timeout = 400 })
	end,
})

-- Enable Tree-sitter
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("treesitter_group"),
	callback = function(args)
		if pcall(vim.treesitter.start, args.buf) then
			vim.wo[0][0].foldmethod = "expr"
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end
	end,
})

-- Close some filetypes with q
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q_group"),
	pattern = {
    "help",
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
