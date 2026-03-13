return {
  {
    'mason-org/mason.nvim',

    config = function()
      local mason = require('mason')
      mason.setup({
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      })

      local mr = require('mason-registry')
      local ensure = {
        -- Python
        'basedpyright',
        'ruff',
        -- Lua
        'lua-language-server',
        'stylua',
        -- Bash
        'shfmt',
        'shellcheck',
        'bash-language-server',
        -- XML
        'xmlformatter',
        -- Markdown
        'marksman',
        -- Oxfmt
        'oxfmt',
      }

      local installing = {}

      mr.refresh(function()
        for _, tool in ipairs(ensure) do
          local pkg = mr.get_package(tool)
          if not pkg:is_installed() then
            table.insert(installing, tool)
            pkg:install()
          end
        end
      end)

      if #installing > 0 then
        vim.notify('Installing ' .. table.concat(installing, ', '))
      end
    end,
  },
}
