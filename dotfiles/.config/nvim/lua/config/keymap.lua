local map = vim.keymap.set

map("n", "<leader>tv", function()
	vim.cmd.vsplit()
	vim.cmd.terminal()
	vim.cmd.startinsert()
end, { desc = "Open terminal (vertical split)" })

map("n", "<leader>th", function()
	vim.cmd.split()
	vim.cmd.terminal()
	vim.cmd.startinsert()
end, { desc = "Open terminal (horizontal split)" })

map("n", "<leader>tt", function()
	vim.cmd.terminal()
	vim.cmd.startinsert()
end, { desc = "Open terminal (horizontal split)" })

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

-- helper: leave Terminal-mode if needed
local function exit_term()
	if vim.fn.mode() == "t" then
		local keys = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)
		vim.api.nvim_feedkeys(keys, "n", false)
	end
end

-- move to window (and re-enter terminal insert if target is a terminal)
local function wmove(dir)
	local was_term = (vim.fn.mode() == "t")
	exit_term()
	vim.cmd("wincmd " .. dir)
	if was_term and vim.bo.buftype == "terminal" then
		vim.cmd("startinsert")
	end
end

-- resize current window by v:count1
local function resize(axis, sign)
	local was_term = (vim.fn.mode() == "t")
	local n = vim.v.count1
	exit_term()
	if axis == "w" then
		vim.cmd("vertical resize " .. sign .. n)
	else
		vim.cmd("resize " .. sign .. n)
	end
	if was_term and vim.bo.buftype == "terminal" then
		vim.cmd("startinsert")
	end
end

-- Window navigation (works in Normal *and* Terminal)
map({ "n", "t" }, "<C-h>", function()
	wmove("h")
end, { desc = "Focus left window" })
map({ "n", "t" }, "<C-j>", function()
	wmove("j")
end, { desc = "Focus below window" })
map({ "n", "t" }, "<C-k>", function()
	wmove("k")
end, { desc = "Focus above window" })
map({ "n", "t" }, "<C-l>", function()
	wmove("l")
end, { desc = "Focus right window" })

-- Window resize (respects v:count1) in Normal *and* Terminal
map({ "n", "t" }, "<C-Right>", function()
	resize("w", "-")
end, { desc = "Decrease window width" })
map({ "n", "t" }, "<C-Left>", function()
	resize("w", "+")
end, { desc = "Increase window width" })
map({ "n", "t" }, "<C-Up>", function()
	resize("h", "-")
end, { desc = "Decrease window height" })
map({ "n", "t" }, "<C-Down>", function()
	resize("h", "+")
end, { desc = "Increase window height" })
