vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

local vk = vim.keymap

local fzflua = require('fzf-lua')

fzflua.setup({
  fzf_colors = true,
  fzf_opts = {
    ['--layout'] = 'default',
  },
  ui_select = {},
})

vk.set('n', '\\\\', function()
  fzflua.builtin()
end, { desc = 'Search' })

vk.set('n', '\\b', function()
  fzflua.buffers()
end, { desc = 'Buffers' })

vk.set('n', '\\f', function()
  fzflua.files()
end, { desc = 'Files' })

vk.set('n', '\\d', function()
  fzflua.diagnostics_document()
end, { desc = 'Documents Diagnostics' })

vk.set('n', '\\D', function()
  fzflua.diagnostics_workspace()
end, { desc = 'Workspace Diagnostics' })

vk.set('n', '\\l', function()
  fzflua.live_grep()
end, { desc = 'Live grep search' })

vk.set('n', '\\c', function()
  fzflua.grep_curbuf()
end, { desc = 'Current buf grep search' })

vk.set('n', '\\s', function()
  fzflua.spell_suggest()
end, { desc = 'Spell suggest' })

vk.set('n', '\\t', function()
  fzflua.grep({
    search = '\\[(TODO|FIXME|HACK|NOTE)\\]',
    cmd = 'rg --color=always --smart-case',
    no_esc = true,
  })
end, { desc = 'Search for TODOS etc' })
