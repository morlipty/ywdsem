local vk = vim.keymap

-- Center screen on jumps
vk.set('n', '<C-d>', '<C-d>zz')
vk.set('n', '<C-u>', '<C-u>zz')
vk.set('n', 'G', 'Gzz')

-- Better movement in insert mode
vk.set('i', '<C-b>', '<Esc>^i')
vk.set('i', '<C-e>', '<End>')

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
vk.set('n', '<Esc>', '<cmd>noh<CR>')

-- Toggle wrapping
vk.set('n', '<leader>tw', function()
  vim.opt.wrap = not vim.opt.wrap
end, { desc = 'Toggle nowrap' })
