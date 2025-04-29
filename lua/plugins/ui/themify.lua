return {
  "lmantw/themify.nvim",
  event = "UiEnter", -- load on Neovim startup
  priority = 999,

  config = function()
    require("themify").setup({
      {
        "folke/tokyonight.nvim",
        blacklist = { "tokyonight-day", "tokyonight-storm" },
      },
      {
        "everviolet/nvim",
        branch = "mega",
        blacklist = { "evergarden-winter", "evergarden-spring" },
      },
      {
        "catppuccin/nvim",
        blacklist = { "catppuccin-latte", "catppuccin-mocha" },
      },
      {
        "rose-pine/neovim",
        blacklist = { "rose-pine-dawn", "rose-pine-moon" },
      },
      "lunarvim/synthwave84.nvim",
      "Shatur/neovim-ayu",
      "phha/zenburn.nvim",
      "projekt0n/github-nvim-theme",
      "ellisonleao/gruvbox.nvim",
      "marko-cerovac/material.nvim",
      "navarasu/onedark.nvim",
      "gbprod/nord.nvim",
      "loctvl842/monokai-pro.nvim",
      "default"
    })
  end,
}
