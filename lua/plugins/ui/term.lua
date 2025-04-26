return {
  's1n7ax/nvim-terminal',
  event = "VeryLazy",
  config = function()
    vim.o.hidden = true
    require('nvim-terminal').setup({
      disable_default_keymaps = true,
    })
    terminal = require('nvim-terminal').DefaultTerminal;

    vim.api.nvim_set_keymap('n', '<leader>t', ':lua terminal:toggle()<cr>', { silent = true, desc = "Toggle Terminal" })
  end,
}
