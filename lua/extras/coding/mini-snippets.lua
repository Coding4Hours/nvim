return {
  {
    "echasnovski/mini.snippets",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local loader = require("mini.snippets").gen_loader
      require("mini.snippets").setup({
        snippets = {
          loader.from_file("~/.config/nvim/snippets/global.json"),
          loader.from_lang(),
        },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      snippets = { preset = "mini_snippets" },
      sources = {
        default = { "snippets" },
      },
    }
  }
}
