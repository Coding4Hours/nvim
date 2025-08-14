local map = vim.keymap.set

-- Window navigation with Ctrl + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- change font
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- better search
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- why does it copy when i wanna delete?
map({ "n", "x" }, "c", '"_c')
map({ "n", "x" }, "x", '"_x')
map({ "n", "x" }, "X", '"_d')

-- buffers
map("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New Buffer" })
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next Buffer" })         -- :bnext
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Previous Buffer" }) -- :bprevious
map("n", "<leader>bd", "<cmd>bdelete!<cr>", { desc = "Delete Buffer" })    -- :bdelete

-- tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader>td", function()
  vim.ui.input({ prompt = ":" }, function(input)
    if input and #input > 0 then
      vim.cmd("tabdo " .. input)
    end
  end)
end, { desc = "Run Command in All Tabs" })

-- telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Files" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Marks" })
map("n", "<leader>ft", "<cmd>lua require('nvchad.themes').open()<cr>", { desc = "Themes" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "ff", "<cmd>Telescope find_files<CR>", { desc = "Files" })

-- Misc.
map("n", "<F8>", "<cmd>Jaq<cr>", { noremap = true, silent = true })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
map("i", "<C-Backspace>", "<C-W>", { noremap = true, silent = true })
map("n", "<C-;>", ";", { noremap = true })
map("n", ";", ":", { noremap = true })


-- Random stuff
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Grep" })
map("n", "U", "<C-r>", { desc = "Undo" })
map("n", "<C-d>", "<C-d>zz", { desc = "PgDn" })
map("n", "<C-u>", "<C-u>zz", { desc = "PgUp" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

map('n', 'q;', 'q:', { noremap = true })
map({ 'n', 'v' }, 'B', '0', { noremap = true })
map({ 'n', 'v' }, 'E', '$', { noremap = true })

vim.keymap.set('n', '<C-/>',
  ':lua (function() if not _G.toggle_term then _G.toggle_term = require("floatty").setup() end _G.toggle_term.toggle() end)()<CR>',
  { silent = true })

vim.keymap.set('t', '<C-/>',
  '<C-\\><C-n>:lua (function() if not _G.toggle_term then _G.toggle_term = require("floatty").setup() end _G.toggle_term.toggle() end)()<CR>',
  { silent = true })
