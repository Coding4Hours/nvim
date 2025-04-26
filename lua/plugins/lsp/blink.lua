return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	event = { "InsertEnter", "CmdlineEnter" },
	version = "*",
	opts = {
		cmdline = {
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},
		completion = {
			accept = {
				auto_brackets = { enabled = true },
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = true,
				show_without_selection = true,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon" },
					},
					treesitter = { "lsp" },
				},
			},
		},
		enabled = function()
			local filetype_is_allowed = not vim.tbl_contains({ "grug-far", "TelescopePrompt" }, vim.bo.filetype)

			local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(0))
			local filesize_is_allowed = true
			if ok and stats then
				---@diagnostic disable-next-line: need-check-nil
				filesize_is_allowed = stats.size < 100 * 1024
			end
			return filetype_is_allowed and filesize_is_allowed
		end,
	},
}
