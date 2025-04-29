return {
  'neovim/nvim-lspconfig',
  event = "BufReadPost",
  dependencies = {
    'zeioth/garbage-day.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')

    mason.setup()

    local servers = {
      'lua_ls',
      'jdtls',
      'ruff',
      'jsonls',
      'yamlls',
      'pyright',
      'marksman',
    }

    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_installation = true,
    })

    for _, server in ipairs(servers) do
      lspconfig[server].setup({})
    end
  end,
}
