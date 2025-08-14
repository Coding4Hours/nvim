local disabled_builtins = {
  -- "netrw",
  -- "netrwPlugin",
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


-- credits to nvchad for this nice event
-- user event that loads after UIEnter + only if file buf is there
vim.api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name "NvFilePost"

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
})

vim.defer_fn(function()
  require("options")
  require("autocmds")
  require("keymaps")
end, 50)


-- Minimal autopairs for ()
local function autopairs_open(pair)
  local close = pair == '(' and ')' or pair == '[' and ']' or pair == '{' and '}' or pair
  return pair .. close .. "<Left>"
end

local function autopairs_close(pair)
  local col = vim.fn.col('.') - 1
  local line = vim.fn.getline('.')
  if line:sub(col + 1, col + 1) == pair then
    return "<Right>"
  else
    return pair
  end
end

-- Mappings
vim.keymap.set('i', '(', function() return autopairs_open('(') end, { expr = true })
vim.keymap.set('i', '[', function() return autopairs_open('[') end, { expr = true })
vim.keymap.set('i', '{', function() return autopairs_open('{') end, { expr = true })

vim.keymap.set('i', ')', function() return autopairs_close(')') end, { expr = true })
vim.keymap.set('i', ']', function() return autopairs_close(']') end, { expr = true })
vim.keymap.set('i', '}', function() return autopairs_close('}') end, { expr = true })
