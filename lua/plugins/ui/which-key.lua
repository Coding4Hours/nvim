return {
	"folke/which-key.nvim",
	event = "BufReadPre",
	opts = {
		preset = "helix",
	},
	config = function(_, opts)
		local wk = require("which-key")

		wk.setup(opts)

		local builtin = require("telescope.builtin")

		wk.add({
			----- UI -----
			{ "<leader>u", group = "UI" },
			{ "<leader>ut", "<cmd>Themify<cr>", desc = "Themes" },
			{ "<leader>un", "<cmd>lua MiniNotify.show_history()<cr>", desc = "Notifications" },

			----- Buffers -----
			{ "<leader>b", group = "Buffers" },
			{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Close buffer" },
			{ "<leader>bn", "<cmd>enew<cr>", desc = "New buffer" },
			{ "<leader>bb", builtin.buffers, desc = "Switch buffer" },
			{ "<leader>bf", "<cmd>lua require('conform').format({ async = true })<cr>", desc = "Format Buffer" },

			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },

			{ "<leader>s", group = "Sessions" },
			{ "<leader>m", "<cmd>RenderMarkdown toggle<cr>", desc = "Render Markdown" },
			{ "<leader>e", "<cmd>lua require('mini.files').open()<cr>", desc = "Explorer" },
		})
	end,
}
