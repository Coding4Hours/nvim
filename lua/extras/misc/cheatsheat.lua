return {
  "shahshlok/vim-coach.nvim",
  dependencies = {
    "folke/snacks.nvim",
    lazy = true,
  },
  opts = {},
  keys = {
    { "<leader>?", "<cmd>VimCoach<cr>", desc = "Vim Coach" },
  },
}
