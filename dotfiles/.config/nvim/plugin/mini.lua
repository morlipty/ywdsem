vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

require('mini.ai').setup()

require('mini.align').setup()

require('mini.bracketed').setup()

require('mini.cursorword').setup()

require('mini.diff').setup()
autocmd('User', {
  pattern = 'MiniDiffUpdated',
  callback = function(ev)
    local summary = vim.b[ev.buf].minidiff_summary
    local t = {}
    if summary.add > 0 then
      table.insert(t, '%#DiagnosticSignInfo#+' .. summary.add)
    end
    if summary.change > 0 then
      table.insert(t, '%#DiagnosticSignWarn#~' .. summary.change)
    end
    if summary.delete > 0 then
      table.insert(t, '%#DiagnosticSignError#-' .. summary.delete)
    end
    vim.b[ev.buf].minidiff_summary_string = table.concat(t, ' ') .. '%*'
  end,
})
map('n', '<leader>to', function()
  MiniDiff.toggle_overlay(0)
end, { desc = 'Toggle Diff overlay' })

require('mini.git').setup()

require('mini.hipatterns').setup({
  highlighters = {
    fixme = {
      pattern = '%f[%w]()FIXME()%f[%W]',
      group = 'MiniHipatternsFixme',
    },
    hack = {
      pattern = '%f[%w]()HACK()%f[%W]',
      group = 'MiniHipatternsHack',
    },
    todo = {
      pattern = '%f[%w]()TODO()%f[%W]',
      group = 'MiniHipatternsTodo',
    },
    note = {
      pattern = '%f[%w]()NOTE()%f[%W]',
      group = 'MiniHipatternsNote',
    },
  },
})

require('mini.icons').setup()

require('mini.indentscope').setup({
  options = {
    try_as_border = true,
  },
  symbol = '│',
})
autocmd('FileType', {
  pattern = {
    'fzf',
    'help',
    'mason',
    'notify',
    'ministarter',
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

require('mini.move').setup()

require('mini.notify').setup()
map('n', '<leader>mh', function()
  MiniNotify.show_history()
end, { desc = 'Notifications history' })

require('mini.sessions').setup()
map('n', '<leader>mn', function()
  vim.ui.input({ prompt = 'Session name: ' }, function(input)
    if input and input ~= '' then
      MiniSessions.write(input)
    else
      print('Session creation canceled')
    end
  end)
end, { desc = 'New session' })
map('n', '<leader>mr', function()
  MiniSessions.select('read')
end, { desc = 'Read session' })
map('n', '<leader>mw', function()
  MiniSessions.select('write')
end, { desc = 'Write session' })
map('n', '<leader>md', function()
  MiniSessions.select('delete')
end, { desc = 'Delete session' })

local mini_snippets = require('mini.snippets')
mini_snippets.setup({
  snippets = {
    mini_snippets.gen_loader.from_lang(),
  },
})

require('mini.splitjoin').setup()

require('mini.surround').setup()

require('mini.tabline').setup()
