vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

require('mini.ai').setup()

require('mini.align').setup()

require('mini.bracketed').setup()

require('mini.cursorword').setup()

require('mini.diff').setup()
vim.api.nvim_create_autocmd('User', {
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

require('mini.hipatterns').setup({
  highlighters = {
    fixme = {
      pattern = '()%[FIXME%]()',
      group = 'DiagnosticSignError',
    },
    hack = {
      pattern = '()%[HACK%]()',
      group = 'DiagnosticSignWarn',
    },
    todo = {
      pattern = '()%[TODO%]()',
      group = 'DiagnosticSignInfo',
    },
    note = {
      pattern = '()%[NOTE%]()',
      group = 'DiagnosticSignHint',
    },
  },
})

require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()

require('mini.indentscope').setup({
  options = {
    try_as_border = true,
  },
  symbol = '│',
})
vim.api.nvim_create_autocmd('FileType', {
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

require('mini.move').setup({
  options = {
    reindent_linewise = false,
  },
})

require('mini.notify').setup()
vim.keymap.set('n', '<leader>mh', function()
  MiniNotify.show_history()
end, { desc = 'Notifications history' })

require('mini.sessions').setup()
vim.keymap.set('n', '<leader>mn', function()
  vim.ui.input({ prompt = 'Session name: ' }, function(input)
    if input and input ~= '' then
      MiniSessions.write(input)
    else
      print('Session creation canceled')
    end
  end)
end, { desc = 'New session' })
vim.keymap.set('n', '<leader>mr', function()
  MiniSessions.select('read')
end, { desc = 'Read session' })
vim.keymap.set('n', '<leader>mw', function()
  MiniSessions.select('write')
end, { desc = 'Write session' })
vim.keymap.set('n', '<leader>md', function()
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
