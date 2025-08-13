dofile(vim.g.base46_cache .. "blink")

local opts = {
  snippets = { preset = "mini_snippets" },
  cmdline = { enabled = true },
  appearance = { nerd_font_variant = "normal" },
  fuzzy = { implementation = "prefer_rust" },
  sources = { default = { "lsp", "snippets", "buffer", "path" } },

  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
  },

  completion = {
    ghost_text = { enabled = true },
    menu = require("nvchad.blink").menu,
  },
}

return opts
