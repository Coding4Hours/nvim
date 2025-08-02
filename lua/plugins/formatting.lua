return {
  -- conform.nvim (formatter)
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "biome" },
        markdown = { "prettier" },
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        yaml = { "prettier" },
        toml = { "taplo" },
      },
    },
  },
}
