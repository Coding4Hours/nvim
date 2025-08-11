return {
	format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
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
}
