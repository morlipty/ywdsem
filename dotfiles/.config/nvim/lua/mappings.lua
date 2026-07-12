local map = vim.keymap.set

-- Copy and paste
map({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
map('x', '<leader>p', '"+P', { desc = 'Paste from system clipboard' })

-- Center screen on jumps
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Window movement
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Better movement in insert mode
map('i', '<M-h>', '<Left>')
map('i', '<M-j>', '<Down>')
map('i', '<M-k>', '<Up>')
map('i', '<M-l>', '<Right>')

-- Window resizing
map('n', '<C-Up>', '<C-w>+')
map('n', '<C-Down>', '<C-w>-')
map('n', '<C-Right>', '<C-w>>')
map('n', '<C-Left>', '<C-w><')

-- Clear highlighting
map('n', '<leader>/', vim.cmd.nohlsearch)

-- Toggle wrapping
map('n', '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = 'Toggle wrapping' })

-- Toggle inlay hints
map('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })
