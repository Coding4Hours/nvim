return {
	{
		"pteroctopus/faster.nvim",
		event = "BufReadPre",
		opts = {},
	},

	{
		"folke/snacks.nvim",
		event = "User FilePost",
		---@type snacks.Config
		opts = {
			rename = { enabled = true },
		},
	},

	{ "nvim-lua/plenary.nvim", lazy = true },
}
