return {
	{
		"echasnovski/mini.icons",
		lazy = true,
		version = false,
	},
	{
		"echasnovski/mini.files",
		cmd = "MiniFiles",
		version = false,
		config = function()
			require("mini.files").setup()
			require("mini.icons").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.notify",
		event = "VeryLazy",
		version = false,
		config = function()
			require("mini.notify").setup()
		end,
	},
	{
		"echasnovski/mini.comment",
		event = "InsertEnter",
		version = false,
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"echasnovski/mini.tabline",
		event = "BufReadPost", -- Load only after a real file is opened
		version = false,
		config = function()
			require("mini.tabline").setup()
			require("mini.icons").setup()
		end,
	},
}
