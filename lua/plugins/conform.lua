return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "autopep8" }, -- switched from isort + black
    javascript = { "prettierd", "prettier", stop_after_first = true },
    java = { "google-java-format" },
    markdown = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },
    yaml = { "prettierd", "prettier", stop_after_first = true },
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  format_on_save = {
    lsp_fallback = false,
    timeout_ms = 1000,
  },

  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
    ["google-java-format"] = {
      command = "/usr/bin/google-java-format",
      args = { "-" },
      stdin = true,
    },
    prettierd = {
      prepend_args = { "--tab-width", "2", "--use-tabs", "false" },
    },
    prettier = {
      prepend_args = { "--tab-width", "2", "--use-tabs", "false" },
    },
    stylua = {
      prepend_args = { "--indent-width", "2" },
    },
    autopep8 = {
      prepend_args = { "--indent-size", "2" },
    },
  },


	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
}
