return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	dependencies = {
		{
			"folke/snacks.nvim",
			opts = {
				image = {},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },
			opts = {},
		},
	},

	cmd = "Obsidian",
	ft = "markdown",
	opts = {
		workspaces = {
			{
				name = "Notes",
				path = "~/notes",
			},
		},
		templates = {
			subdir = "templates",
		},
	},
}
