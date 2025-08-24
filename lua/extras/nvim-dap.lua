MiniDeps.add("jay-babu/mason-nvim-dap.nvim")
MiniDeps.add({
  source = "mfussenegger/nvim-dap",
  depends = "rcarriga/nvim-dap-ui"
})




vim.keymap.set('n', '<leader>dB', function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
  { desc = "Breakpoint Condition" })
vim.keymap.set('n', '<leader>db', function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set('n', '<leader>dc', function() require("dap").continue() end, { desc = "Run/Continue" })
vim.keymap.set('n', '<leader>dC', function() require("dap").run_to_cursor() end, { desc = "Run to Cursor" })
vim.keymap.set('n', '<leader>di', function() require("dap").step_into() end, { desc = "Step Into" })
vim.keymap.set('n', '<leader>dj', function() require("dap").down() end, { desc = "Down" })
vim.keymap.set('n', '<leader>dk', function() require("dap").up() end, { desc = "Up" })
vim.keymap.set('n', '<leader>dl', function() require("dap").run_last() end, { desc = "Run Last" })
vim.keymap.set('n', '<leader>do', function() require("dap").step_out() end, { desc = "Step Out" })
vim.keymap.set('n', '<leader>dO', function() require("dap").step_over() end, { desc = "Step Over" })
vim.keymap.set('n', '<leader>dP', function() require("dap").pause() end, { desc = "Pause" })
vim.keymap.set('n', '<leader>dr', function() require("dap").repl.toggle() end, { desc = "Toggle REPL" })
vim.keymap.set('n', '<leader>ds', function() require("dap").session() end, { desc = "Session" })
vim.keymap.set('n', '<leader>dt', function() require("dap").terminate() end, { desc = "Terminate" })
vim.keymap.set('n', '<leader>dw', function() require("dap.ui.widgets").hover() end, { desc = "Widgets" })

vim.keymap.set('n', '<leader>du', function() require("dapui").toggle({}) end, { desc = "Dap UI" })
vim.keymap.set({ 'n', 'v' }, '<leader>de', function() require("dapui").eval() end, { desc = "Eval" })
