vim.g.mapleader = " "



--==============================================================================
-- Mini.deps
--==============================================================================

local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"

if not vim.uv.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`..." | redraw')
  local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('echo "Installed `mini.nvim`." | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })

local add, later = MiniDeps.add, MiniDeps.later

later(function()
  require("options")
  require("autocmds")
  require("keymaps")
end)

--==============================================================================
-- Plugins
--==============================================================================



add("folke/snacks.nvim")
add('dstein64/vim-startuptime')
add({ source = "rose-pine/neovim", name = "rose-pine" })
add('saghen/blink.cmp')
add({
  source = 'mason-org/mason-lspconfig.nvim',
  depends = {
    'mason-org/mason.nvim',
    'neovim/nvim-lspconfig'
  }
})
add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'main',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})



later(function()
  local get_first_line = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, 1, true)
    return lines[1] or ''
  end
  local is_something_shown = vim.fn.argc() > 0
      or #vim.tbl_filter(function(id) return vim.fn.buflisted(id) == 1 end, vim.api.nvim_list_bufs()) > 1
      or vim.bo.filetype ~= ''
      or vim.api.nvim_buf_line_count(0) > 1
      or #get_first_line() > 0

  if not is_something_shown and vim.fn.filereadable("Session.vim") == 1 then
    vim.cmd("source Session.vim")
  end

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
  vim.notify = require('mini.notify').make_notify()
  require("mini.statusline").setup()
  require("mini.pairs").setup()
  require("mini.icons").setup()
  require("snacks").setup({ picker = require("configs.picker") })
  require('blink.cmp').setup(require('configs.cmp'))
end)
