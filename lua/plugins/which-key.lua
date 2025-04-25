-- ~/.config/nvim/lua/plugins/which-key.lua
return {
	"folke/which-key.nvim",
	event = "BufReadPre",
	opts = {
		preset = "classic",
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
	},
	config = function()
		local wk = require("which-key")

		wk.add({
			----- UI -----
			{ "<leader>u", group = "UI" },
			{ "<leader>ut", "<cmd>Themify<cr>", desc = "Themes" },
			{ "<leader>un", "<cmd>lua MiniNotify.show_history()<cr>", desc = "Notifications" },

			----- Buffers -----
			{ "<leader>b", group = "Buffers" },
			{ "<leader>bq", "<cmd>bdelete<cr>", desc = "Close buffer" },
			{ "<leader>bn", "<cmd>enew<cr>", desc = "New buffer" },
			{
				"<leader>bb",
				function()
					require("mini.pick").builtin.buffers()
				end,
				desc = "Switch buffer",
			},
			{ "<leader>f", "<cmd>lua require('conform').format({ async = true })<cr>", desc = "Format Buffer" },

			{ "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },
			{ "<leader>m", "<cmd>RenderMarkdown toggle<cr>", desc = "Render Markdown" },
			{ "<leader>e", "<cmd>lua require('mini.files').open()<cr>", desc = "Explorer" },
		})
	end,
}
