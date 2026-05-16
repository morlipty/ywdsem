vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

local conform = require('conform')

conform.setup({
  default_format_opts = {
    quiet = false,
    async = false,
    timeout_ms = 3000,
    lsp_format = 'fallback',
  },

  formatters_by_ft = {
    python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
    lua = { 'stylua' },
    sh = { 'shfmt' },
    bash = { 'shfmt' },
    toml = { 'oxfmt' },
    json = { 'oxfmt' },
    jsonc = { 'oxfmt' },
    yaml = { 'oxfmt' },
    css = { 'oxfmt' },
    markdown = { 'oxfmt' },
    rust = { 'rustfmt' },
  },
})

vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
  conform.format({})
end, { desc = 'Format file' })
