-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {

		{ import = "plugins" },

		{ import = "extras.misc.wakatime" },
		{ import = "extras.ai.windsurf" },
		{ import = "extras.editor.obsidian" },
		{ import = "extras.utils.ts-comments" },
		{
			"dmtrKovalenko/fff.nvim",
			build = "cargo build --release",
			-- or if you are using nixos
			-- build = "nix run .#release",
			opts = {
				-- pass here all the options
			},
			keys = {
				{
					"ff", -- try it if you didn't it is a banger keybinding for a picker
					'<cmd>require("fff").find_files()<cr>', -- or find_in_git_root() if you only want git files
					desc = "Open file picker",
				},
			},
		},
	},
}, {
	defaults = { lazy = true },
	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},

	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})
