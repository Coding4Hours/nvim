require("mini.surround").setup({})
require("mini.pairs").setup({})
require("mini.notify").setup({
	lsp_progress = {
		enable = false,
	},
})

return {
	-- Blink.cmp
	{
		"Saghen/blink.cmp",
		event = "InsertEnter",
		version = "*",
		dependencies = {
			"mikavilpas/blink-ripgrep.nvim",
		},
		opts = function()
			return require("configs.cmp")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "User FilePost",
		opts = {
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
		},
	},
	{
		"nvchad/ui",
		lazy = false,
		config = function()
			require("nvchad")
			dofile(vim.g.base46_cache .. "defaults")
			dofile(vim.g.base46_cache .. "statusline")
		end,
	},
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
	},

	-- mason
	{
		"williamboman/mason.nvim",
		cmd = { "Mason" },
		event = "User FilePost",
		opts = {},
	},

	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		event = "User FilePost",
		opts = function()
			return require("configs.mason")
		end,
	},

	-- mason-tool-installer (for formatters/linters)
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "User FilePost",
		cmd = {
			"MasonToolsClean",
			"MasonToolsInstall",
			"MasonToolsInstallSync",
			"MasonToolsUpdate",
			"MasonToolsUpdateSync",
		},
		opts = function()
			return require("configs.mason-tools")
		end,
	},

	-- Java Support
	{
		"nvim-java/nvim-java",
		ft = "java",
		config = function()
			require("java").setup({
				jdk = {
					auto_install = false,
				},
			})
			require("lspconfig").jdtls.setup({})
		end,
	},

	{
		"aznhe21/actions-preview.nvim",
		opts = {},
		event = "LspAttach",
	},
	-- Colorscheme
	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	-- Icons
	{
		"nvim-tree/nvim-web-devicons",
		event = "User FilePost",
		opts = function()
			dofile(vim.g.base46_cache .. "devicons")
			return { override = require("nvchad.icons.devicons") }
		end,
	},

	-- Ui Library
	{
		"nvchad/volt",
		lazy = true,
	},
	{
		"folke/snacks.nvim",
		event = "User FilePost",
		opts = {
			input = { enabled = true },
		},
	},

	{
		"hedyhli/outline.nvim",
		keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
		cmd = "Outline",
		opts = {
			outline_window = {
				position = "left",
				width = 10,
			},
			keymaps = {
				up_and_jump = "<up>",
				down_and_jump = "<down>",
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			defaults = {},
			spec = {
				----- Groups -----
				{ "<leader>c", group = "Code" },
				{ "<leader>b", group = "Buffers" },
				{ "<leader>f", group = "Find" },
				{ "<leader>t", group = "Tabs" },
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup(require("configs.treesitter"))
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
		cmd = "Telescope",
		opts = function()
			return require("configs.telescope")
		end,
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "echasnovski/mini.nvim", version = false, lazy = true },
}
