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

local add, later = MiniDeps.add, MiniDeps.later



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
add("folke/snacks.nvim")
add('dstein64/vim-startuptime')
add('nvim-lua/plenary.nvim')
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


later(function()
  local is_something_shown = function()
    if vim.fn.argc() > 0 then return true end

    local listed_buffers = vim.tbl_filter(
      function(buf_id) return vim.fn.buflisted(buf_id) == 1 end,
      vim.api.nvim_list_bufs()
    )
    if #listed_buffers > 1 then return true end

    if vim.bo.filetype ~= '' then return true end

    local n_lines = vim.api.nvim_buf_line_count(0)
    if n_lines > 1 then return true end
    local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, true)[1]
    if string.len(first_line) > 0 then return true end

    return false
  end

  local session_file = "Session.vim"
  if not is_something_shown() then
    if vim.fn.filereadable(session_file) == 1 then
      vim.cmd("source " .. session_file)
    end
  end



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
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
  require("mini.statusline").setup()
  require("mini.pairs").setup()
  require("snacks").setup({ picker = require("configs.picker") })
end)
