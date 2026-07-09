---@type vim.lsp.Config
return {
  cmd = { 'oxfmt', '--lsp' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'toml',
    'json',
    'jsonc',
    'json5',
    'yaml',
    'html',
    'vue',
    'handlebars',
    'css',
    'scss',
    'less',
    'graphql',
    'markdown',
  },
  workspace_required = true,
  root_markers = {
    '.oxfmtrc.json',
    '.oxfmtrc.jsonc',
  },
}
