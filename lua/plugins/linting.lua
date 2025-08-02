return {
  -- nvim-lint (linter)
  {
    "mfussenegger/nvim-lint",
    event = "User FileEnter",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        lua = { "luacheck" },
        markdown = { "markdownlint" },
        go = { "golangci_lint" },
        yaml = { "yamllint" },
        toml = { "taplo" },
      }

     vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
