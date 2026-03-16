local vk = vim.keymap

-- Hover
vk.set('n', 'K', function()
  vim.lsp.buf.hover({
    border = 'rounded',
  })
end, { desc = 'Hover documentation' })

-- Go to definition
vk.set('n', 'grd', function()
  vim.lsp.buf.definition()
end, { desc = 'vim.lsp.buf.definition()' })

-- Codelens run
vk.set('n', '<leader>cr', function()
  vim.lsp.codelens.run()
end, { desc = 'Codelens run' })

-- Codelens refresh
vk.set('n', '<leader>cR', function()
  vim.lsp.codelens.refresh()
end, { desc = 'Codelens refresh' })

-- Toggle diagnostics virtual mode
vim.keymap.set('n', '<leader>td', function()
  local state = vim.diagnostic.config() or {}
  vim.diagnostic.config({
    virtual_text = not state.virtual_text,
    virtual_lines = not state.virtual_lines,
  })
end, { desc = 'Toggle virtual mode' })
