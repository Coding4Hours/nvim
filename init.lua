-- load keybindings
require("config.keybindings")
require("config.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = require("config.lazy")

require("lazy").setup({
	{ import = "plugins" },
  { import = "plugins.lang" },
  { import = "plugins.ui" },
  { import = "plugins.lsp" },
}, lazy_config)

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
