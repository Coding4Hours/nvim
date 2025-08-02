return {
  -- Windsurf
  {
    "Exafunction/codeium.nvim",
    event = "User FilePost",
    lazy = true,
    build = ":Codeium Auth",
    opts = {
      enable_cmp_source = true,
      virtual_text = {
        enabled = false,
        key_bindings = {
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    },
  },
  
  -- Blink.cmp
  {
    "Saghen/blink.cmp",
    event = "User FilePost",
    version = "*",
    dependencies = {
      { "saghen/blink.compat", lazy = true },
    },
    opts = {
      sources = {
        compat = { "codeium" },
        providers = {
          codeium = {
            name = "Codeium",
            module = "codeium.blink",
            async = true,
          },
        },
      },
    },
  }
}
