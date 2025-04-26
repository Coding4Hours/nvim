return {
  {
    "echasnovski/mini.completion",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.completion").setup()
    end,
  },
  {
    "echasnovski/mini.icons",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.icons").setup()
    end,
  },
  {
    "echasnovski/mini.files",
    cmd = "MiniFiles",
    version = false,
    config = function()
      require("mini.files").setup()
    end,
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.notify",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.notify").setup()
    end,
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.comment").setup()
    end,
  },
  {
    "echasnovski/mini.tabline",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.tabline").setup()
    end,
  },


}
