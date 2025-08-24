vim.defer_fn(function()
  --==============================================================================
  -- Mini.deps
  --==============================================================================
  local path_package = vim.fn.stdpath("data") .. "/site/"
  local mini_path = path_package .. "pack/deps/start/mini.nvim"

  if not vim.uv.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`..." | redraw')
    local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
    vim.fn.system(clone_cmd)
    vim.cmd('echo "Installed `mini.nvim`." | redraw')
  end

  require("mini.deps").setup({ path = { package = path_package } })

  local add = MiniDeps.add

  vim.g.mapleader = " "
  require("options")
  require("autocmds")
  require("keymaps")


  --==============================================================================
  -- Plugins
  --==============================================================================
  add("folke/snacks.nvim")
  add({ source = "rose-pine/neovim", name = "rose-pine" })
  add('saghen/blink.cmp')
  add({
    source = 'mason-org/mason-lspconfig.nvim',
    depends = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig'
    }
  })
  add("dstein64/vim-startuptime")
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'main',
  })


  --==============================================================================
  -- Initialization
  --==============================================================================
  require("rose-pine").setup({
    styles = {
      transparency = true,
    },
  })
  vim.cmd.colorscheme "rose-pine"

  require('mason').setup({})
  require('mason-lspconfig').setup(require('configs.mason'))
  require('nvim-treesitter').setup(require('configs.treesitter'))
  require('mini.notify').setup()
  require("mini.pairs").setup()
  require("snacks").setup({ picker = require("configs.picker") })
  require('blink.cmp').setup(require('configs.cmp'))
  require("mini.statusline").setup()


  --==============================================================================
  -- End
  --==============================================================================
end, 50)
