local map = vim.keymap.set

-- Copy and paste
map({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
map('x', '<leader>p', '"+P', { desc = 'Paste from system clipboard' })

-- Center screen on jumps
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

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

-- Reselect latest changed, put, or yanked text
map('n', 'gV', function()
  return '`[' .. vim.fn.getregtype():sub(1, 1) .. '`]'
end, {
  expr = true,
  replace_keycodes = false,
  desc = 'Visually select changed text',
})

-- Better esc key
map({ 'n', 'i', 's' }, '<esc>', function()
  vim.cmd.nohlsearch()
  return '<esc>'
end, { expr = true })

-- Toggle wrapping
map('n', '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = 'Toggle line wrapping' })

-- Toggle inlay hints
map('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle LSP inlay hints' })
