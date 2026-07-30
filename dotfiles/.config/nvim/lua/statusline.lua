local b = vim.b
local autocmd = vim.api.nvim_create_autocmd
local get_mode = vim.api.nvim_get_mode

local function update_lsp_client_names(ev)
  local clients = vim.lsp.get_clients({ bufnr = ev.buf })

  local detaching_id = ev.event == 'LspDetach' and ev.data.client_id
  local names = {}

  for _, client in ipairs(clients) do
    if client.id ~= detaching_id then
      names[#names + 1] = client.name
    end
  end

  b[ev.buf].lsp_client_names = #names > 0 and ' ' .. table.concat(names, ' ') or nil
end

autocmd({ 'LspAttach', 'LspDetach' }, { callback = update_lsp_client_names })

local function mode(name, hl)
  return string.format('%%#Stl%sInv#%%#Stl%s#%s%%#Stl%sInv#%%* ', hl, hl, name, hl)
end

-- stylua: ignore start
local modes = setmetatable({
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
}, {
  __index = function(t, k)
    t[k] = mode(k, 'Normal')
    return t[k]
  end,
})
-- stylua: ignore end

function Statusline()
  return modes[get_mode().mode]
    .. (b.minigit_summary_string or '')
    .. ' '
    .. (b.minidiff_summary_string or '')
    .. '%=%<%F %r%m%h%='
    .. vim.diagnostic.status()
    .. (b.lsp_client_names or '')
    .. ' %y'
end

vim.o.statusline = '%{%v:lua.Statusline()%}'
