dofile(vim.g.base46_cache .. "blink")

return {
  keymap = {
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },

    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },

    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

    ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
  },
  cmdline = {
    completion = { menu = { auto_show = false }, ghost_text = { enabled = false } },
  },
  completion = {
    list = { selection = { auto_insert = false } },
  },
  sources = {
    default = { "lsp", "ripgrep" },
    providers = {
      ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
      },
    },
  },
}
