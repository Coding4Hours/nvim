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
  { import = "plugins.perf" },
  { import = "plugins.editor" },
  { import = "plugins.cp" },
}, lazy_config)
