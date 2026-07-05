return {
  cmd = { 'basedpyright-langserver', '--stdio' },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
      },
    },
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
