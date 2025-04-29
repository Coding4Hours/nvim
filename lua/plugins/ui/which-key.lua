return {
  "folke/which-key.nvim",
  event = "BufReadPre",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    preset = "helix",
  },
  config = function(_, opts)
    local wk = require("which-key")

    wk.setup(opts)

    wk.add({
      ----- Groups -----
      { "<leader>r",  group = "Replace" },
      { "<leader>c",  group = "Code" },
      { "<leader>u",  group = "UI" },
      { "<leader>b",  group = "Buffers" },
      { "<leader>s",  group = "Sessions" },
      { "<leader>f",  group = "find" },

      ----- UI -----
      { "<leader>ut", "<cmd>Themify<cr>",                                         desc = "Themes" },
      { "<leader>un", "<cmd>lua MiniNotify.show_history()<cr>",                   desc = "Notifications" },

      ----- Buffers -----
      { "<leader>bd", "<cmd>bdelete<cr>",                                         desc = "Close buffer" },
      { "<leader>bn", "<cmd>enew<cr>",                                            desc = "New buffer" },
      { "<leader>bb", "<cmd>Telescope buffers<cr>",                               desc = "Switch buffer" },
      { "<leader>bf", "<cmd>lua require('conform').format({ async = true })<cr>", desc = "Format Buffer" },


      { "<leader>ff", "<cmd>Telescope find_files<cr>",                            desc = "Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",                             desc = "Grep" },
      { "<leader>fb", "<cmd>Telescope Buffers<cr>",                               desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",                             desc = "Help" },

      { "<leader>ca", vim.lsp.buf.code_action,                                    desc = "Code Action",    mode = { "n", "v" } },

      { "<leader>m",  "<cmd>RenderMarkdown toggle<cr>",                           desc = "Render Markdown" },
      { "<leader>e",  "<cmd>lua require('mini.files').open()<cr>",                desc = "File Explorer" },
    })
  end,
}
