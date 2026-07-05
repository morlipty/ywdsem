vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

require('mini.ai').setup()

require('mini.align').setup()

require('mini.bracketed').setup()

require('mini.cursorword').setup()

require('mini.diff').setup()

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

require('mini.snippets').setup()
MiniSnippets.gen_loader.from_lang()

require('mini.splitjoin').setup()

require('mini.surround').setup()

require('mini.tabline').setup()
