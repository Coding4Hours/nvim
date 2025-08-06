return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = true,
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				autotag = {
					enable = true,
				},
			})
		end,
	},

	{
		"m-demare/hlargs.nvim",
		opts = {},
		event = "BufReadPre",
	},
}
