vim.defer_fn(function()
  vim.g.mapleader = " "
  require("options")
  require("autocmds")
  require("keymaps")

  --==============================================================================
  -- Plugins
  --==============================================================================
  vim.pack.add({ "https://github.com/folke/snacks.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
    'https://github.com/saghen/blink.cmp',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    "https://github.com/dstein64/vim-startuptime",
    {
      src = 'https://github.com/nvim-treesitter/nvim-treesitter',
      version = 'main',
    }
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
  require("lualine").setup {}
end, 50)
