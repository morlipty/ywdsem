local o = vim.o
local g = vim.g

-- Leader keys
g.mapleader = ' '
g.maplocalleader = ' '

-- Visual
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.fillchars = 'eob: '
o.list = true
o.listchars = 'extends:…,precedes:…'

o.winborder = 'rounded'
o.pumborder = 'rounded'

o.foldlevel = 10
o.laststatus = 3

o.scrolloff = 8
o.sidescrolloff = 8
o.smoothscroll = true

o.wrap = false
o.linebreak = true
o.breakindent = true
o.breakindentopt = 'list:-1'

o.showmode = false
o.ruler = false

-- Behavior
o.updatetime = 200

o.confirm = true
o.undofile = true

o.tabstop = 2
o.expandtab = true
o.shiftwidth = 2
o.shiftround = true
o.smartindent = true

o.smartcase = true
o.ignorecase = true

o.jumpoptions = 'view'
o.splitkeep = 'screen'
o.splitbelow = true
o.splitright = true

o.virtualedit = 'block'

-- Disable built in providers
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
