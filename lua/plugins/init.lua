return {
  -- Blink.cmp
  {
    "Saghen/blink.cmp",
    event = "InsertEnter",
    version = "*",
    dependencies = {
      "mikavilpas/blink-ripgrep.nvim",
    },
    opts = require("configs.cmp"),
  },
  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require("nvchad")
      dofile(vim.g.base46_cache .. "defaults")
      dofile(vim.g.base46_cache .. "statusline")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "User FilePost",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        lua = { "luacheck" },
        markdown = { "markdownlint" },
        go = { "golangci_lint" },
        yaml = { "yamllint" },
        toml = { "taplo" },
      }

      lint.try_lint()
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
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    event = "User FilePost",
    opts = {},
  },

  -- mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    event = "User FilePost",
    opts = require("configs.mason"),
  },

  {
    "aznhe21/actions-preview.nvim",
    opts = {},
    event = "LspAttach",
  },
  -- Colorscheme
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
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

  -- Ui Library
  {
    "nvchad/volt",
    lazy = true,
  },
  {
    "folke/snacks.nvim",
    event = "User FilePost",
    opts = {
      input = { enabled = true },
    },
  },

  {
    "hedyhli/outline.nvim",
    keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
    cmd = "Outline",
    opts = require("configs.outline"),
  },
  {
    "folke/which-key.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },
    event = "VeryLazy",
    opts = require("configs.which-key"),
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup(require("configs.treesitter"))
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
    cmd = "Telescope",
    opts = function()
      return require("configs.telescope")
    end,
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "echasnovski/mini.nvim", version = false, lazy = true },
}
