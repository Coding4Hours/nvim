for _, path in ipairs(vim.api.nvim_get_runtime_file('', true)) do
  local plugin_dir = path .. '/plugin'
  if vim.fn.isdirectory(plugin_dir) == 1 then
    for _, filepath in ipairs(vim.fn.glob(plugin_dir .. '/*.vim', true, true)) do
      local plugin_name = vim.fn.fnamemodify(filepath, ':t:r')
      vim.g['loaded_' .. plugin_name] = 1
    end
  end
end

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


require("mini.sessions").setup()
require("mini.starter").setup()


-- Plugin List
add("folke/twilight.nvim")
add('nvim-lua/plenary.nvim')
add('nvim-tree/nvim-web-devicons')
add({ source = 'rose-pine/neovim', name = 'rose-pine' })
add('akinsho/bufferline.nvim')
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

later(function()
  require('rose-pine').setup({
    styles = {
      transparency = true,
    },
  })
  vim.cmd.colorscheme('rose-pine')

  -- require('bufferline').setup({})

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
