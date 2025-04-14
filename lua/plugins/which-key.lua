-- ~/.config/nvim/lua/plugins/which-key.lua
return {
  "folke/which-key.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    preset = "classic",
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    }
  },
  config = function()
    local wk = require("which-key")

    wk.add({
      ----- UI -----
      { "<leader>u", group = "UI" },
      { "<leader>ut", "<cmd>Themify<cr>", desc = "Themes" },
      { "<leader>un", "<cmd>lua MiniNotify.show_history()<cr>", desc = "Notifications" },

      ----- Buffers -----
      { "<leader>b", group = "Buffers" },
      { "<leader>bq", "<cmd>bdelete<cr>", desc = "Close buffer" },
      { "<leader>bn", "<cmd>enew<cr>", desc = "New buffer" },
 --     { "<leader>bb", "<cmd>lua require('fzf-lua').buffers()<cr>", desc = "View buffers" },
      { "<leader>bb", function() require("mini.pick").builtin.buffers() end, desc = "Switch buffer" },


      { "<leader>e", "<cmd>lua require('mini.files').open()<cr>", desc = "Explorer" },

    })
  end,
}
