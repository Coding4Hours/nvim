return {
  {
    "nvim4hours/pairs.nvim",
    event = "InsertEnter",
    opts = {}
  },

  {
    "nvchad/ui",
    event = "UiEnter",
    config = function()
      require("nvchad")
      dofile(vim.g.base46_cache .. "defaults")
      dofile(vim.g.base46_cache .. "statusline")
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvchad/volt",
    lazy = true,
  },

  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "saghen/blink.cmp",
    build = "cargo build --release",
    version = "1.*",
    event = { "InsertEnter", "CmdLineEnter" },

    opts = function()
      return require "configs/cmp"
    end,
  },


  {
    "neovim/nvim-lspconfig",
    event = "UIEnter",
    config = function()
      require("configs.lspconfig").defaults()
    end,
  },

  {
    "mason-org/mason.nvim",
    cmd = { "Mason" },
    event = "UIEnter",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    event = "UIEnter",
    opts = function()
      return require("configs.mason")
    end,
  },


  {
    "nvim-tree/nvim-web-devicons",
    event = "UIEnter",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require("nvchad.icons.devicons") }
    end,
  },


  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = "UIEnter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require("configs.treesitter")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
          require('telescope').load_extension('fzf')
        end
      }
    },
    cmd = "Telescope",
    opts = function()
      return require("configs.telescope")
    end,
  }
}
