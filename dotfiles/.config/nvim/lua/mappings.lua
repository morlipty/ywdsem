local vk = vim.keymap

-- Center screen on jumps
vk.set('n', '<C-d>', '<C-d>zz')
vk.set('n', '<C-u>', '<C-u>zz')

-- Window movement
vk.set('n', '<C-k>', '<C-w>k')
vk.set('n', '<C-j>', '<C-w>j')
vk.set('n', '<C-l>', '<C-w>l')
vk.set('n', '<C-h>', '<C-w>h')

-- Window resizing
vk.set('n', '<C-Up>', '<C-w>+')
vk.set('n', '<C-Down>', '<C-w>-')
vk.set('n', '<C-Right>', '<C-w>>')
vk.set('n', '<C-Left>', '<C-w><')

-- Clear highlighting
vk.set('n', '<leader>/', '<cmd>noh<CR>', { desc = 'Clear highlighting' })

-- Toggle wrapping
vk.set('n', '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = 'Toggle wrapping' })
