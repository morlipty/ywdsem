-- LSP list to enable
vim.lsp.enable({
  -- lua
  'lua_ls',
  -- bash
  'bashls',
  -- c
  'clangd',
  -- python
  'ty',
  'ruff',
  -- rust
  'rust_analyzer',
  -- markdown
  'marksman',
  -- github actions
  'gh_actions_ls',
  -- fish
  'fish_lsp',
})

-- Diagnostics configuration
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = {
    spacing = 2,
    prefix = '●',
  },
  float = {
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
})
