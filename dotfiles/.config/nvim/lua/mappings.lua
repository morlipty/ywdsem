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

-- Clear highlighting
map('n', '<Esc>', vim.cmd.nohlsearch)

-- Reselect latest changed, put, or yanked text
map('n', 'gV', function()
  return '`[' .. vim.fn.getregtype():sub(1, 1) .. '`]'
end, {
  expr = true,
  replace_keycodes = false,
  desc = 'Visually select changed text',
})

local function map_toggle(key, name, toggle)
  map('n', '<leader>t' .. key, function()
    local is_enabled
    if type(toggle) == 'string' then
      is_enabled = not vim.wo[toggle]
      vim.wo[toggle] = is_enabled
    elseif type(toggle) == 'table' then
      is_enabled = not toggle.is_enabled({ bufnr = 0 })
      toggle.enable(is_enabled, { bufnr = 0 })
    elseif type(toggle) == 'function' then
      is_enabled = toggle()
    end
    vim.notify(('%s: %s'):format(name, is_enabled and 'On' or 'Off'))
  end, { desc = 'Toggle ' .. name })
end

map_toggle('w', 'Wrapping', 'wrap')
map_toggle('s', 'Spell checking', 'spell')
map_toggle('r', 'Relative numbers', 'relativenumber')

map_toggle('i', 'LSP inlay hints', vim.lsp.inlay_hint)
map_toggle('c', 'Codelens', vim.lsp.codelens)
