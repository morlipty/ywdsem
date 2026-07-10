local o = vim.o
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

o.confirm = true
o.undofile = true
o.updatetime = 200

-- UI & Appearance
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'

o.cursorline = true
o.cursorlineopt = 'screenline,number'

o.ruler = false
o.showmode = false
o.laststatus = 3

o.list = true
o.fillchars = 'eob: '
o.listchars = 'extends:…,precedes:…'

o.winborder = 'rounded'
o.pumborder = 'rounded'

o.wrap = false
o.linebreak = true
o.breakindent = true
o.breakindentopt = 'list:-1'

o.foldlevel = 10

-- Editing & Indentation
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.shiftround = true

o.smartindent = true
o.virtualedit = 'block'

-- Search
o.smartcase = true
o.ignorecase = true

-- Scrolling & Navigation
o.scrolloff = 8
o.sidescrolloff = 8
o.smoothscroll = true
o.jumpoptions = 'view'

-- Splits
o.splitbelow = true
o.splitright = true
o.splitkeep = 'screen'

-- Disable built in providers
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
