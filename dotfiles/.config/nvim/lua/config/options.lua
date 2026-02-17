local o = vim.opt

-- Leader keys
vim.g.mapleader = " "             -- Set leader key to space
vim.g.maplocalleader = " "        -- Set local leader key to space

-- Basic settings
o.number = true                   -- Line numbers
o.relativenumber = true           -- Relative line numbers
o.cursorline = true               -- Highlight current line
o.undofile = true                 -- Enable undo history file
o.clipboard:append("unnamedplus") -- Use system clipboard
o.confirm = true                  -- Show conformation menu on close

-- Indentation
o.tabstop = 2                     -- Tab width
o.softtabstop = 2                 -- Soft tab stop
o.shiftwidth = 2                  -- Indent width
o.expandtab = true                -- Use spaces instead of tabs
o.smartindent = true              -- Smart auto-indenting

-- Search settings
o.smartcase = true                -- Case-sensitive if uppercase in search
o.ignorecase = true               -- Case insensitive search
o.inccommand = "split"            -- Preview mode for %s

-- Wrapping settings
o.wrap = false                    -- Disable word wrapping(can be switched manually)
o.whichwrap:append("h,l")         -- h and l keys move cursor to next/previous lines
o.linebreak = true                -- Better wrapping
o.breakindent = true              -- Every wrapped line will continue visually indented

-- Visual settings
o.signcolumn = "yes:2"            -- Always show a sign column with 2 width
o.statuscolumn = "│%s│%l│ "       -- Status column style
o.laststatus = 3                  -- Single status line
o.smoothscroll = true             -- Enable smooth scrolling
o.scrolloff = 10                  -- Keep 10 lines above/below cursor
o.sidescrolloff = 8               -- Keep 8 columns left/right of cursor
o.splitkeep = "screen"            -- Keep the text on the same screen line
o.splitbelow = true               -- New window at below
o.splitright = true               -- New window at right

-- Time settings
o.updatetime = 200                -- Faster swap file saving
o.timeoutlen = 300                -- Key timeout duration
