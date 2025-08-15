return {

  { 'echasnovski/mini.doc',  lazy = true, version = false, opts = {} },
  {
    "coding4hours/pairs.nvim",
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
    event = { "InsertEnter", "CmdLineEnter" },

    opts = function()
      return require "configs/cmp"
    end,
  },


  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("configs.lspconfig").defaults()
    end,
  },

  {
    "mason-org/mason.nvim",
    cmd = { "Mason" },
    event = "User FilePost",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    event = "User FilePost",
    opts = function()
      return require("configs.mason")
    end,
  },


  {
    "nvim-tree/nvim-web-devicons",
    event = "User FilePost",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require("nvchad.icons.devicons") }
    end,
  },


  {
    "nvim-treesitter/nvim-treesitter",
    event = "User FilePost",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup(require("configs.treesitter"))
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = function()
      return require("configs.telescope")
    end,
  }
}
