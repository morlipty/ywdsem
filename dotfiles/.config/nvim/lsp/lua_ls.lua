return {
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      codeLens = {
        enable = true,
      },
      hint = {
        enable = true,
        semicolon = 'Disable',
      },
    },
  },
  filetypes = {
    'lua',
  },
  root_markers = {
    '.emmyrc.json',
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
}
