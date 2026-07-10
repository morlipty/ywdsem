local map = vim.keymap.set

-- Copy and paste
map({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
map('x', '<leader>p', '"+P', { desc = 'Paste from system clipboard' })

-- Center screen on jumps
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Better movement in insert mode
map('i', '<M-k>', '<Up>')
map('i', '<M-j>', '<Down>')
map('i', '<M-l>', '<Right>')
map('i', '<M-h>', '<Left>')

-- Window resizing
map('n', '<C-Up>', '<C-w>+')
map('n', '<C-Down>', '<C-w>-')
map('n', '<C-Right>', '<C-w>>')
map('n', '<C-Left>', '<C-w><')

-- Toggle wrapping
map('n', '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = 'Toggle wrapping' })

-- Toggle inlay hints
map('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })
