return {

  {
    "nvchad/ui",
    lazy = false,
    enabled = true,
    config = function()
      require("nvchad")
      dofile(vim.g.base46_cache .. "defaults")
      dofile(vim.g.base46_cache .. "statusline")
    end,
  },

  -- Colorscheme
  {
    "nvchad/base46",
    lazy = true,
    enabled = true,
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

   {
     'stevearc/oil.nvim',
     opts = {},
     dependencies = { "nvim-tree/nvim-web-devicons" },
     event = "VimEnter",
   },

   -- Blink.cmp
   {
     "Saghen/blink.cmp",
     event = "InsertEnter",
     version = "*",
     dependencies = {
       "mikavilpas/blink-ripgrep.nvim",
     },
     opts = function()
       require("configs.cmp")
     end,
   },
   -- lspconfig
   {
     "neovim/nvim-lspconfig",
     event = "User FilePost"
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
     "stevearc/dressing.nvim",
     event = "User FilePost",
   },

   {
     "folke/which-key.nvim",
     dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },
     event = "VeryLazy",
     opts = function()
       require("configs.which-key")
     end
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
     cmd = "Telescope",
     opts = function()
       return require("configs.telescope")
     end,
   },
  { "echasnovski/mini.nvim", version = false, lazy = true },
}
