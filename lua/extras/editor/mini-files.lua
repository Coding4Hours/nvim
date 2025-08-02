return {{
  "echasnovski/mini.files",
  cmd = "MiniFiles",
  dependencies = {
    { "echasnovski/mini.icons", lazy = true, opts = {} },
  },
  keys = {
    { "<leader>e", "<cmd>lua require('mini.files').open()<cr>", desc = "File Explorer" },
  },
  version = false,
  opts = {},
},{
    enabled = false,
    "nvim-neo-tree/neo-tree.nvim",
}}
