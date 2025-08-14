return {
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
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  {
    "ingur/floatty.nvim",
    lazy = true,
  },
  -- Colorscheme
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  -- Ui Library
  {
    "nvchad/volt",
    lazy = true,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  -- Blink.cmp
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdLineEnter" },

    dependencies = {
      {
        "echasnovski/mini.snippets",
        version = false,
        opts = function()
          return {
            snippets = { require("mini.snippets").gen_loader.from_lang() },
          }
        end,
      },
    },

    opts = function()
      return require "configs/cmp"
    end,
  },


  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("configs.lspconfig").defaults()
    end,
  },

  -- mason
  {
    "mason-org/mason.nvim",
    cmd = { "Mason" },
    event = "User FilePost",
    opts = {},
  },

  -- mason-lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    event = "User FilePost",
    opts = function()
      return require("configs.mason")
    end,
  },


  -- Icons
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
