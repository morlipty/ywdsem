local o = vim.opt

-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
o.number = true
o.relativenumber = true
o.cursorline = true
o.signcolumn = "yes:2"

-- word wraping
o.wrap = false
o.whichwrap:append("h,l")
o.linebreak = true
o.breakindent = true

-- misc
o.confirm = true
o.laststatus = 3
o.clipboard = "unnamedplus"

-- scrolling
o.smoothscroll = true
o.scrolloff = 4
o.sidescrolloff = 8

-- identation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- time decreasing
o.updatetime = 200
o.timeoutlen = 300

-- searching
o.smartcase = true
o.ignorecase = true

-- window rules
o.splitkeep = "screen"
o.splitbelow = true
o.splitright = true

-- undo
o.undofile = true

-- live preview
o.inccommand = "split"
