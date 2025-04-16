return {
	"lmantw/themify.nvim",
	event = "VimEnter", -- load on Neovim startup
	priority = 999,

	config = function()
		require("themify").setup({
			{
				"folke/tokyonight.nvim",
				blacklist = { "tokyonight-day", "tokyonight-storm" },
			},
			{
				"everviolet/nvim",
				branch = "mega",
				blacklist = { "evergarden-winter", "evergarden-spring" },
			},
			{
				"catppuccin/nvim",
				blacklist = { "catppuccin-latte", "catppuccin-mocha" },
			},
			{
				"rose-pine/neovim",
				blacklist = { "rose-pine-dawn", "rose-pine-moon" },
			},
			"dracula/vim",
		})
	end,
}
