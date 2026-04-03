-- LSP list to enable
vim.lsp.enable({
  -- Lua
  'lua_ls',
  -- Bash
  'bashls',
  -- Python
  'ty',
  'ruff',
  -- Rust
  'rust_analyzer',
  -- Markdown
  'marksman',
  -- Oxfmt
  'oxfmt',
})

-- Diagnostics configuration
local signs = {
  [vim.diagnostic.severity.ERROR] = '󰅚 ',
  [vim.diagnostic.severity.WARN] = '󰀪 ',
  [vim.diagnostic.severity.INFO] = '󰋽 ',
  [vim.diagnostic.severity.HINT] = '󰌶 ',
}

vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = { spacing = 2, prefix = '●' },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { source = true },
  signs = { text = signs },
  status = { format = signs },
})

-- Go to definition
vim.keymap.set('n', 'grd', function()
  vim.lsp.buf.definition()
end, { desc = 'vim.lsp.buf.definition()' })
