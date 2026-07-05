vim.pack.add({
  {
    src = 'https://github.com/Saghen/blink.cmp',
    version = vim.version.range('1.*'),
  },
})

local blink = require('blink.cmp')

blink.setup({
  snippets = {
    preset = 'mini_snippets',
  },

  completion = {
    menu = {
      draw = {
        treesitter = { 'lsp' },
        columns = {
          { 'kind_icon' },
          { 'label', 'label_description', gap = 1 },
          { 'kind' },
          { 'source_name' },
        },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    ghost_text = {
      enabled = true,
    },
  },

  signature = {
    enabled = true,
  },

  cmdline = {
    completion = {
      menu = { auto_show = true },
    },
  },
})
