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

-- buffers
map("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New Buffer" })
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next Buffer" })         -- :bnext
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Previous Buffer" }) -- :bprevious
map("n", "<leader>bd", "<cmd>bdelete!<cr>", { desc = "Delete Buffer" })    -- :bdelete


-- telescope
map("n", "<leader>fh", "<cmd>lua Snacks.picker.help()<CR>", { desc = "Help" })
map("n", "<leader>fd", "<cmd>lua Snacks.picker.diagnostics()<CR>", { desc = "Diagnostics" })
map("n", "ff", "<cmd>lua Snacks.picker.files()<CR>", { desc = "Files" })

-- Misc.
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
map("i", "<C-Backspace>", "<C-W>", { noremap = true, silent = true })
map("n", "<C-;>", ";", { noremap = true })
map("n", ";", ":", { noremap = true })


-- Random stuff
map("n", "<leader>/", "<cmd>lua Snacks.picker.grep()<cr>", { desc = "Grep" })
map("n", "<C-d>", "<C-d>zz", { desc = "PgDn" })
map("n", "<C-u>", "<C-u>zz", { desc = "PgUp" })
map("n", "<Tab>", "<CMD>lua Snacks.picker.buffers()<CR>", { desc = "Tabs" })

map({ 'n', 'v' }, 'B', '0', { noremap = true })
map({ 'n', 'v' }, 'E', '$', { noremap = true })



map('n', 'ht', ':split | resize -15 | terminal<CR>', { silent = true })
map('n', 'vt', ':rightbelow vsplit | vertical resize -15 | terminal<CR>', { silent = true })


map("n", "<leader>?", "<cmd>lua Snacks.picker.keymaps()<CR>", { desc = "keymap help" })
map("n", "sl", "<cmd>source Session.vim<CR>", { desc = "Load Session" })
map("n", "ss", "<cmd>mksession<CR>", { desc = "Save session" })
