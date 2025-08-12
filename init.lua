local disabled_builtins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "matchit",
  "matchparen",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "2html_plugin",
  "tohtml",
  "tutor",
  "rplugin",
  "synmenu",
  "syntax",
  "synload",
  "syncolor",
  "man",
  "vimrc",
  "zipPlugin",
  "health",
  "shada",
  "shada_plugin",
  "compiler",
  "bugreport",
  "ftplugin",
  "indent",
  "scripts",
  "spellfile",
  "spell",
  "usr_42",
}

for _, plugin in ipairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 1
end


vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

vim.g.startuptime_tries = 10
vim.g.mapleader = " "



require("lazy_setup")

vim.defer_fn(function()
  require("options")
  require("autocmds")
  require("keymaps")
end, 50)
