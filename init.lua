vim = vim

-- Disable default Neovim runtime plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1

--vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("config.lazy")

require("lazy").setup({
	spec = {
		{ import = "plugins" },

		{ import = "extras.misc.wakatime" },
		{ import = "extras.ai.windsurf" },
		{ import = "extras.editor.mini-files" },
		{ import = "extras.ui.mini-starter" },
		{ import = "extras.editor.obsidian" },
	},
}, lazy_config)

require("config.options")
require("config.autocmds")
require("config.keymaps")
