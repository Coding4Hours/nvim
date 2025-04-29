return {
  "gbprod/substitute.nvim",

  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()
  end,

  -- stylua: ignore
  keys = {
    { "<leader>rs", function() require("substitute").operator() end, desc = "Substitute with motion" },
    { "<leader>rr", function() require("substitute").line() end,     desc = "Subsitute line" },
    { "<leader>rS", function() require("subsitute").eol() end,       desc = "Subsitute to end of line" },
    { "<leader>rs", function() require("subsitute").visual() end,    desc = "Subsitute in visual mode", mode = "x" },
  },

}
