-- LSP list to enable
vim.lsp.enable({
  -- Lua
  'lua_ls',
  -- Bash
  'bashls',
  -- Python
  -- 'ty',
  'basedpyright',
  'ruff',
  -- Rust
  'rust_analyzer',
  -- Markdown
  'marksman',
  -- Oxfmt
  'oxfmt',
  -- Github actions
  'gh_actions_ls',
  -- Fish
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
