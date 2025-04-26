return {
	"stevearc/conform.nvim",
	event = { "BufReadPost" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "autopep8" }, -- switched from isort + black
			javascript = { "prettierd", "prettier", stop_after_first = true },
			java = { "prettier" },
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
			prettierd = {
				prepend_args = {
					"--tab-width",
					"2",
					"--use-tabs",
					"false",
					"--plugin=prettier-plugin-java", -- Correct plugin name
				},
			},
			prettier = {
				prepend_args = {
					"--tab-width",
					"2",
					"--use-tabs",
					"false",
					"--plugin=prettier-plugin-java", -- Correct plugin name
				},
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
	},
}
