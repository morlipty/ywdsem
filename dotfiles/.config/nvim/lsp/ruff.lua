return {
  cmd = { 'ruff', 'server' },
  settings = {},
  filetypes = {
    'python',
  },
  root_markers = {
    'pyproject.toml',
    'ruff.toml',
    '.ruff.toml',
    '.git',
  },
}
