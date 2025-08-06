return {
	{
		"mfussenegger/nvim-lint",
		event = "User FileEnter",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				-- javascript = { "biome" },
				-- typescript = { "biome" },
				lua = { "luacheck" },
				markdown = { "markdownlint" },
				go = { "golangci_lint" },
				yaml = { "yamllint" },
				toml = { "taplo" },
			}

			lint.try_lint()
		end,
	},
}
