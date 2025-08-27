vim.defer_fn(function()
	vim.g.mapleader = " "


	--==============================================================================
	-- Plugins
	--==============================================================================
	vim.pack.add({ "https://github.com/folke/snacks.nvim",
		"https://github.com/nvim-lualine/lualine.nvim",
		'https://github.com/saghen/blink.cmp',
		'https://github.com/mason-org/mason-lspconfig.nvim',
		'https://github.com/mason-org/mason.nvim',
		'https://github.com/neovim/nvim-lspconfig',

		{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
		"https://github.com/dstein64/vim-startuptime",
		{
			src = 'https://github.com/nvim-treesitter/nvim-treesitter',
			version = 'main',
		}
	})


	--==============================================================================
	-- Initialization
	--==============================================================================
	require("rose-pine").setup({
		styles = {
			transparency = true,
		},
	})
	vim.cmd.colorscheme "rose-pine"

	require('mason').setup({})
	require('mason-lspconfig').setup(require('configs.mason'))
	require('nvim-treesitter').setup(require('configs.treesitter'))
	require('mini.notify').setup()
	require("mini.pairs").setup()
	require("mini.trailspace").setup()

	require("snacks").setup({ picker = require("configs.picker"), select = {} })
	require('blink.cmp').setup(require('configs.cmp'))
	require("lualine").setup {}


	require("keymaps")
	require("options")
	require("autocmds")
end, 0)
