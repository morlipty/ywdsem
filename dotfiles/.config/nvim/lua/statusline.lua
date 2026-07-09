local api = vim.api
local b = vim.b

api.nvim_create_autocmd({ 'LspAttach', 'LspDetach' }, {
  callback = vim.schedule_wrap(function(ev)
    local buf = ev.buf
    local clients = vim.lsp.get_clients({ bufnr = buf })

    if #clients > 0 then
      local names = {}
      for i = 1, #clients do
        names[i] = clients[i].name
      end
      b[buf].lsp_clients = table.concat(names, ' ')
    else
      b[buf].lsp_clients = nil
    end

    vim.cmd('redrawstatus')
  end),
})

-- stylua: ignore start
local function mode(name, hl)
  return table.concat({
    '%#Stl' , hl , 'Inv#',
    '',
    '%#Stl' , hl , '#', name,
    '%#Stl' , hl , 'Inv#',
    '',
    '%* '})
end
local modes = {
  ['n']   = mode('NORMAL', 'Normal'),
  ['v']   = mode('VISUAL', 'Visual'),
  ['V']   = mode('V-LINE', 'Visual'),
  ['\22'] = mode('V-BLCK', 'Visual'),
  ['s']   = mode('SELECT', 'Visual'),
  ['S']   = mode('S-LINE', 'Visual'),
  ['\19'] = mode('S-BLCK', 'Visual'),
  ['i']   = mode('INSERT', 'Insert'),
  ['R']   = mode('REPLCE', 'Replace'),
  ['c']   = mode('CMDLIN', 'Command'),
  ['r']   = mode('PROMPT', 'Command'),
  ['!']   = mode('  SH  ', 'Command'),
  ['t']   = mode(' TERM ', 'Terminal'),
}
-- stylua: ignore end

function Statusline()
  local m = api.nvim_get_mode().mode

  return table.concat({
    modes[m] or m,
    b.minidiff_summary_string or '',
    '%=%<%F %r%m%h%=',
    vim.diagnostic.status(),
    ' ',
    b.lsp_clients or '',
    ' %y',
  })
end

vim.o.statusline = '%{%v:lua.Statusline()%}'
