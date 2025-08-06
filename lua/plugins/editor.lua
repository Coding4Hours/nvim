return {
	{
		"folke/snacks.nvim",
		event = "User FilePost",
		---@type snacks.Config
		opts = {
			indent = { enabled = true },
			input = { enabled = true },
		},
	},
	{
		"folke/snacks.nvim",
		event = "UiEnter",
		---@type snacks.Config
		opts = {
			picker = { enabled = true },
		},
	},
	{
		"is0n/jaq-nvim",
		cmd = { "Jaq" },
		lazy = true,
		opts = {
			cmds = {
				external = {
					markdown = "glow %",
					python = "python3 %",
					go = "go run %",
					sh = "sh %",
				},
			},
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
			preset = "helix",
			defaults = {},
			spec = {
				----- Groups -----
				{ "<leader>c", group = "Code" },
				{ "<leader>b", group = "Buffers" },
				{ "<leader>s", group = "Search" },
				{ "<leader>t", group = "Tabs" },

				----- Telescope -----
				{ "<leader>sf", "<cmd>lua Snacks.picker.files()<cr>", desc = "Files" },
				{ "<leader>sg", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Grep" },
				{ "<leader>sb", "<cmd>lua Snacks.picker.buffers()<cr>", desc = "Buffers" },
				{ "<leader>sh", "<cmd>lua Snacks.picker.help()<cr>", desc = "Help" },
				{ "<leader>sm", "<cmd>lua Snacks.picker.marks()<cr>", desc = "Marks" },
				{ "<leader>st", "<cmd>lua require('nvchad.themes').open()<cr>", desc = "Themes" },
				{ "<leader>sd", "<cmd>lua Snacks.picker.diagnostics()<cr>", desc = "Diagnostics" },

				----- Code -----
				{
					"<leader>ca",
					"<cmd>lua require('actions-preview').code_actions()<cr>",
					desc = "Code Action",
				},
				{ "<leader>cg", "<cmd>Jaq<cr>", desc = "Run" },
				{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },

				----- random stuff -----
				{ "<leader>/", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Grep" },
				{ "<leader>:", "<cmd>lua Snacks.picker.command_history()<cr>", desc = "Command History" },

				{ "<C-/>", "<cmd>lua Snacks.terminal.open()<cr>", desc = "Terminal" },
				{ "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy" },
			},
		},
	},
	{
		"nvim-zh/better-escape.vim",
		event = "InsertEnter",
	},
}
