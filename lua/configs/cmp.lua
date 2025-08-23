local opts = {
  cmdline = { enabled = true },
  appearance = { nerd_font_variant = "normal" },
  fuzzy = {
    implementation = "prefer_rust",
    prebuilt_binaries = {
      force_version = "1.*"
    }
  },
  sources = { default = { "lsp", "snippets", "buffer", "path" } },

  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
  },

  completion = {
    ghost_text = { enabled = true },
    -- menu = require("nvchad.blink").menu,
  },
}

return opts
