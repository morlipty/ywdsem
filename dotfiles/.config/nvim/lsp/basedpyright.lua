---@type vim.lsp.Config
return {
  cmd = { 'basedpyright-langserver', '--stdio' },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
      },
    },
  },
  handlers = {
    --- filter noisy notifications
    ['$/progress'] = function(err, result, ctx)
      -- just notify once
      if result.token == (vim.g.basedpyright_progress_token or result.token) then
        vim.g.basedpyright_progress_token = result.token
        vim.lsp.handlers['$/progress'](err, result, ctx)
      end
    end,
  },
  filetypes = {
    'python',
  },
  root_markers = {
    'pyrightconfig.json',
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
}
