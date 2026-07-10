local vk = vim.keymap

-- Copy and paste
vk.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vk.set('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vk.set('x', '<leader>p', '"+P', { desc = 'Paste from system clipboard' })

-- Center screen on jumps
vk.set('n', '<C-d>', '<C-d>zz')
vk.set('n', '<C-u>', '<C-u>zz')

-- Better movement in insert mode
vk.set('i', '<M-k>', '<Up>')
vk.set('i', '<M-j>', '<Down>')
vk.set('i', '<M-l>', '<Right>')
vk.set('i', '<M-h>', '<Left>')

-- Window resizing
vk.set('n', '<C-Up>', '<C-w>+')
vk.set('n', '<C-Down>', '<C-w>-')
vk.set('n', '<C-Right>', '<C-w>>')
vk.set('n', '<C-Left>', '<C-w><')

-- Toggle wrapping
vk.set('n', '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = 'Toggle wrapping' })

-- Toggle inlay hints
vk.set('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })
