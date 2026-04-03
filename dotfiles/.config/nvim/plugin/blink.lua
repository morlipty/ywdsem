vim.pack.add({
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range('*') },
})

local blink = require('blink.cmp')

blink.setup({
  snippets = {
    preset = 'mini_snippets',
  },

  keymap = {
    preset = 'default',
  },

  appearance = {
    nerd_font_variant = 'mono',
  },

  sources = {
    default = {
      'lsp',
      'path',
      'snippets',
      'buffer',
    },
  },

  completion = {
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },

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
  },

  signature = {
    enabled = true,
  },

  cmdline = {
    completion = {
      menu = { auto_show = true },
    },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },
})
