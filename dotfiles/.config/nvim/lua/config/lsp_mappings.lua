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

vk.set('n', '<leader>tdt', function()
  vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
  })
end, { desc = 'Virtual text mode' })

vk.set('n', '<leader>tdl', function()
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = true,
  })
end, { desc = 'Virtual lines mode' })

vk.set('n', '<leader>tdo', function()
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
  })
end, { desc = 'Toggle diagnostics off' })
