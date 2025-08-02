local map = vim.keymap.set

-- Window navigation with Ctrl + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })


-- Moving lines and preserving indentation
map("i", "<A-h>", "<Left>", { desc = "move left" })
map("i", "<A-l>", "<Right>", { desc = "move right" })
map("i", "<A-j>", "<Down>", { desc = "move down" })
map("i", "<A-k>", "<Up>", { desc = "move up" })

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
map({'n', 'x'}, 'c', '"_c')
map({'n', 'x'}, 'x', '"_x')
map({'n', 'x'}, 'X', '"_d')


-- buffers
map("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New Buffer" })
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next Buffer" })        -- :bnext
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Previous Buffer" }) -- :bprevious
map("n", "<leader>bc", "<cmd>lua require('snacks').bufdelete()<cr>", { desc = "Delete Buffer" })     -- :bdelete


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


-- Misc.
map('n', '<F8>', "<cmd>Jaq<cr>", { noremap = true, silent = true })
map('n', 'r', '<C-r>')
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
map("i", "<C-Backspace>", "<C-W>", { noremap = true, silent = true })
map('n', ';', ':', { noremap = true })
