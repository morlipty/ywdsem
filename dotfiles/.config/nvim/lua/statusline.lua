local lsp = {}
vim.api.nvim_create_autocmd({ 'LspAttach', 'LspDetach' }, {
  callback = vim.schedule_wrap(function(args)
    local buf = args.buf
    local clients = vim.lsp.get_clients({ bufnr = buf })
    if #clients > 0 then
      local names = {}
      for i = 1, #clients do
        names[i] = clients[i].name
      end
      lsp[buf] = ' ' .. table.concat(names, ' ') .. ' '
    else
      lsp[buf] = nil
    end
  end),
})

vim.api.nvim_create_autocmd({ 'BufDelete', 'BufWipeout' }, {
  callback = function(args)
    lsp[args.buf] = nil
  end,
})

local modes = {
  ['n'] = '| NORMAL | ',
  ['v'] = '| VISUAL | ',
  ['V'] = '| V-LINE | ',
  ['\22'] = '| V-BLOCK | ',
  ['s'] = '| SELECT | ',
  ['S'] = '| S-LINE | ',
  ['\19'] = '| S-BLOCK | ',
  ['i'] = '| INSERT | ',
  ['R'] = '| REPLACE | ',
  ['c'] = '| COMMAND | ',
  ['r'] = '| PROMPT | ',
  ['!'] = '| SHELL | ',
  ['t'] = '| TERMINAL | ',
}

function Statusline()
  local m = vim.api.nvim_get_mode().mode
  return (modes[m] or m)
    .. (vim.b.minidiff_summary_string or '')
    .. '%=%F %r%m%h%='
    .. vim.diagnostic.status()
    .. (lsp[vim.api.nvim_get_current_buf()] or '')
    .. '%y'
end

vim.o.statusline = '%{%v:lua.Statusline()%}'
