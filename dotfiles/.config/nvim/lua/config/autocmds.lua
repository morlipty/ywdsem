-- Highlight text on yank
local highlight_yank_group = vim.api.nvim_create_augroup("highlight_yank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	desc = "highlight text on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 200, visual = true })
	end,
})

-- Enable folding
local ts_fold_group = vim.api.nvim_create_augroup("treesitter_folds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = ts_fold_group,
	desc = "Enable Tree-sitter folding when parser is available",
	callback = function()
		if pcall(vim.treesitter.get_parser, 0) then
			vim.wo.foldlevel = 99
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		else
			vim.wo.foldmethod = "manual"
		end
	end,
})
