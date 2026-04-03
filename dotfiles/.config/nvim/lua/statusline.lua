local lsp = {}

vim.api.nvim_create_autocmd({ 'LspAttach', 'LspDetach' }, {
  callback = vim.schedule_wrap(function(args)
    local clients = vim.lsp.get_clients({ bufnr = args.buf })

    if #clients == 0 then
      lsp[args.buf] = nil
    else
      local names = {}
      for i = 1, #clients do
        names[i] = clients[i].name
      end
      lsp[args.buf] = table.concat(names, ' ')
    end
  end),
})

local current_mode = '| NORMAL | '
local modes = {
  ['n'] = 'NORMAL',
  ['v'] = 'VISUAL',
  ['V'] = 'V-LINE',
  ['\22'] = 'V-BLOCK',
  ['s'] = 'SELECT',
  ['S'] = 'S-LINE',
  ['\19'] = 'S-BLOCK',
  ['i'] = 'INSERT',
  ['R'] = 'REPLACE',
  ['c'] = 'COMMAND',
  ['r'] = 'PROMPT',
  ['!'] = 'SHELL',
  ['t'] = 'TERMINAL',
}

vim.api.nvim_create_autocmd('ModeChanged', {
  callback = function()
    local m = vim.api.nvim_get_mode().mode
    current_mode = '| ' .. (modes[m:sub(1, 1)] or m) .. ' | '
  end,
})

function Statusline()
  local bufn = vim.api.nvim_get_current_buf()
  return current_mode
    .. (vim.b.minidiff_summary_string or '')
    .. '%=%F %r%m%h%='
    .. vim.diagnostic.status()
    .. ' '
    .. (lsp[bufn] or '')
    .. ' %y'
end

vim.opt.statusline = '%!v:lua.Statusline()'
