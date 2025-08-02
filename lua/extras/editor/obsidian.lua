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
			dependencies = { "echasnovski/mini.icons" },
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
