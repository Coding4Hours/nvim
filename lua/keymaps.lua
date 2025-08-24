local map = vim.keymap.set

-- Window navigation with Ctrl + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
--
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
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Marks" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "ff", "<cmd>Telescope find_files<CR>", { desc = "Files" })

-- Misc.
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
map("n", "<Tab>", "<CMD>Telescope buffers<CR>", { desc = "Tabs" })

map({ 'n', 'v' }, 'B', '0', { noremap = true })
map({ 'n', 'v' }, 'E', '$', { noremap = true })



map('n', 'ht', ':split | resize -15 | terminal<CR>', { silent = true })
map('n', 'vt', ':rightbelow vsplit | vertical resize -15 | terminal<CR>', { silent = true })


map("n", "<leader>?", "<cmd>Telescope keymaps<CR>", { desc = "keymap help" })
map("n", "<leader>sl", "<cmd>lua MiniSessions.select()<CR>", { desc = "keymap help" })
