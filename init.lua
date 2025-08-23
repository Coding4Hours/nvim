--==============================================================================
-- Mini.deps
--==============================================================================

local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.uv.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later



later(function()
  vim.g.mapleader = " "
  require("options")
  require("autocmds")
  require("keymaps")
end)



--==============================================================================
-- Plugins
--==============================================================================




-- Plugin List
add('dstein64/vim-startuptime')
add("folke/twilight.nvim")
add('nvim-lua/plenary.nvim')
add('nvim-tree/nvim-web-devicons')
add({ source = 'rose-pine/neovim', name = 'rose-pine' })
add('saghen/blink.cmp')
add('neovim/nvim-lspconfig')
add('mason-org/mason.nvim')
add('mason-org/mason-lspconfig.nvim')
add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'main',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})
add({ source = 'nvim-telescope/telescope.nvim' })

now(function()
  require("mini.sessions").setup { autoread = true }
end)

later(function()
  require('rose-pine').setup({
    styles = {
      transparency = true,
    },
  })
  vim.cmd.colorscheme('rose-pine')

  require('blink.cmp').setup(require('configs.cmp'))
  require('mason').setup({})
  require('mason-lspconfig').setup(require('configs.mason'))
  require('nvim-treesitter').setup(require('configs.treesitter'))
  require('telescope').setup(require('configs.telescope'))
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
  require("mini.statusline").setup()
  require("mini.pairs").setup()
end)
