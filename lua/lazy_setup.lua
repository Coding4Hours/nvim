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

    { import = "extras.wakatime" },
    { import = "extras.nvim-dap" },
  },
}, {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },
})
