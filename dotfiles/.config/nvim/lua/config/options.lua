local opt = vim.opt

-- Leader keys
vim.g.mapleader = ' '               -- Set leader key to space
vim.g.maplocalleader = ' '          -- Set local leader key to space

-- Visual
opt.number = true                   -- Line numbers
opt.relativenumber = true           -- Relative line numbers
opt.signcolumn = 'yes:2'            -- Always show a sign column with 2 width
opt.statuscolumn = '│%s│%l│ '       -- Status column style
opt.cursorline = true               -- Highlight current line

opt.foldlevel = 99                  -- Set folding level to max
opt.laststatus = 3                  -- Single status line

opt.scrolloff = 4                   -- Keep 4 lines above/below cursor
opt.sidescrolloff = 8               -- Keep 8 columns left/right of cursor
opt.smoothscroll = true             -- Enable smooth scrolling

opt.wrap = false                    -- Disable word wrapping
opt.linebreak = true                -- Better wrapping
opt.breakindent = true              -- Every wrapped line will continue visually indented

opt.ruler = false                   -- Disable built in ruler

-- Behavior
opt.updatetime = 200                -- Faster swap file saving
opt.timeoutlen = 300                -- Key timeout duration

opt.confirm = true                  -- Show conformation menu on close
opt.undofile = true                 -- Enable undo history file

opt.tabstop = 2                     -- Tab width
opt.expandtab = true                -- Use spaces instead of tabs
opt.shiftwidth = 2                  -- Indent width
opt.shiftround = true               -- Round indent to multiple of shiftwidth
opt.smartindent = true              -- Smart auto-indenting

opt.smartcase = true                -- Case-sensitive if uppercase in search
opt.ignorecase = true               -- Case insensitive search

opt.jumpoptions = "view"            -- Remember screen position on jumps
opt.splitkeep = 'screen'            -- Keep the text on the same screen line
opt.splitbelow = true               -- New window at below
opt.splitright = true               -- New window at right

opt.virtualedit = "block"           -- Allow cursor to move where there is no text in visual block mode
opt.whichwrap:append('h,l')         -- h and l keys move cursor to next/previous lines

opt.clipboard:append('unnamedplus') -- Use system clipboard
