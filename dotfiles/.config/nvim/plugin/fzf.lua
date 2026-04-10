vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

local fzflua = require('fzf-lua')

fzflua.setup({
  fzf_colors = true,
  fzf_opts = {
    ['--layout'] = 'default',
  },
})

fzflua.register_ui_select(function(_, items)
  local min_h, max_h = 0.15, 0.70
  local h = (#items + 4) / vim.o.lines
  if h < min_h then
    h = min_h
  elseif h > max_h then
    h = max_h
  end
  return { winopts = { height = h, width = 0.60, row = 0.40 } }
end)

vim.keymap.set('n', '\\\\', function()
  fzflua.builtin()
end, { desc = 'Search' })

vim.keymap.set('n', '\\b', function()
  fzflua.buffers()
end, { desc = 'Buffers' })

vim.keymap.set('n', '\\f', function()
  fzflua.files()
end, { desc = 'Files' })

vim.keymap.set('n', '\\d', function()
  fzflua.diagnostics_document()
end, { desc = 'Documents Diagnostics' })

vim.keymap.set('n', '\\D', function()
  fzflua.diagnostics_workspace()
end, { desc = 'Workspace Diagnostics' })

vim.keymap.set('n', '\\l', function()
  fzflua.live_grep()
end, { desc = 'Live grep search' })

vim.keymap.set('n', '\\c', function()
  fzflua.grep_curbuf()
end, { desc = 'Current buf grep search' })

vim.keymap.set('n', '\\s', function()
  fzflua.spell_suggest()
end, { desc = 'Spell suggest' })

vim.keymap.set('n', '\\t', function()
  fzflua.grep({
    search = 'TODO|FIXME|HACK|NOTE',
    cmd = "rg --color=always --smart-case -g '!mini.lua' -g '!fzf.lua'",
    no_esc = true,
  })
end, { desc = 'Search for TODOS etc' })
