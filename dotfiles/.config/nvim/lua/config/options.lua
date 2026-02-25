local opt = vim.opt

-- Leader keys
vim.g.mapleader = " "               -- Set leader key to space
vim.g.maplocalleader = " "          -- Set local leader key to space

-- Basic settings
opt.number = true                   -- Line numbers
opt.relativenumber = true           -- Relative line numbers
opt.cursorline = true               -- Highlight current line
opt.undofile = true                 -- Enable undo history file
opt.clipboard:append("unnamedplus") -- Use system clipboard
opt.confirm = true                  -- Show conformation menu on close

-- Indentation
opt.tabstop = 2                     -- Tab width
opt.softtabstop = 2                 -- Soft tab stop
opt.shiftwidth = 2                  -- Indent width
opt.expandtab = true                -- Use spaces instead of tabs
opt.smartindent = true              -- Smart auto-indenting

-- Search settings
opt.smartcase = true                -- Case-sensitive if uppercase in search
opt.ignorecase = true               -- Case insensitive search
opt.inccommand = "split"            -- Preview mode for %s

-- Wrapping settings
opt.wrap = false                    -- Disable word wrapping(can be switched manually)
opt.whichwrap:append("h,l")         -- h and l keys move cursor to next/previous lines
opt.linebreak = true                -- Better wrapping
opt.breakindent = true              -- Every wrapped line will continue visually indented

-- Visual settings
opt.foldlevel = 99
opt.signcolumn = "yes:2"            -- Always show a sign column with 2 width
opt.statuscolumn = "│%s│%l│ "       -- Status column style
opt.laststatus = 3                  -- Single status line
opt.smoothscroll = true             -- Enable smooth scrolling
opt.scrolloff = 10                  -- Keep 10 lines above/below cursor
opt.sidescrolloff = 8               -- Keep 8 columns left/right of cursor
opt.splitkeep = "screen"            -- Keep the text on the same screen line
opt.splitbelow = true               -- New window at below
opt.splitright = true               -- New window at right

-- Time settings
opt.updatetime = 200                -- Faster swap file saving
opt.timeoutlen = 300                -- Key timeout duration
