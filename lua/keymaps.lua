local map = vim.keymap.set

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
map({ "n", "x" }, "<leader>d", '"_d')


-- telescope
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
-- Misc.
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
map("i", "<C-Backspace>", "<C-W>", { noremap = true, silent = true })
map("n", "<C-;>", ";", { noremap = true })
map("n", ";", ":", { noremap = true })


-- Random stuff
map("n", "<C-d>", "<C-d>zz", { desc = "PgDn" })
map("n", "<C-u>", "<C-u>zz", { desc = "PgUp" })

map({ 'n', 'v' }, 'B', '0', { noremap = true })
map({ 'n', 'v' }, 'E', '$', { noremap = true })



map('n', 'ht', ':split | resize -15 | terminal<CR>', { silent = true })
map('n', 'vt', ':rightbelow vsplit | vertical resize -15 | terminal<CR>', { silent = true })


map('n', '<leader>bd', '<CMD>lua MiniBufremove.delete()<CR>', { silent = true })

map("n", "<leader>?", "<cmd>Pick keymaps<CR>", { desc = "keymap help" })
map("n", "<leader>/", "<cmd>Pick grep<cr>", { desc = "Grep" })
map("n", "<Tab>", "<CMD>Pick buffers<CR>", { desc = "Tabs" })
map("n", "<leader>fh", "<cmd>Pick help<CR>", { desc = "Help" })
map("n", "<leader>fd", "<cmd>Pick diagnostics<CR>", { desc = "Diagnostics" })
map("n", "ff", "<cmd>Pick files<CR>", { desc = "Files" })


map("n", "sl", "<cmd>source Session.vim<CR>", { desc = "Load Session" })
map("n", "ss", "<cmd>mksession<CR>", { desc = "Save session" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
