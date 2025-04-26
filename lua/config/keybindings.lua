vim.g.mapleader = " "
local map = vim.keymap.set

-- map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Map Esc to escape from terminal insert mode to normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
