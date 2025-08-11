local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set


-- credits to nvchad for this nice event
-- user event that loads after UIEnter + only if file buf is there
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name "NvFilePost"

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
})


autocmd("BufWritePre", {
  desc = "Automatically create parent directories if they don't exist when saving a file",
  callback = function(args)
    vim.lsp.buf.format({ bufnr = args.buf, async = true })

    local dir = vim.fn.fnamemodify(vim.uv.fs_realpath(args.match) or args.match, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

autocmd("InsertEnter", {
  desc = "setup",
  callback = function()
    require("mini.surround").setup({})
    require("mini.pairs").setup({})
    require("mini.notify").setup({
      lsp_progress = {
        enable = false,
      },
    })
  end,
})




-- Setup autocmd for LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf



    map("n", "<leader>cs", function() require('telescope.builtin').lsp_document_symbols() end,
      { desc = "LSP: Document Symbols" })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
    map("n", "<leader>cr", function() require('nvchad.lsp.renamer')() end, { desc = "LSP: Rename" })

    map("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "LSP: Go to Declaration" })
    map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
    map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to Declaration" })
    map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
    map("n", "D", vim.lsp.buf.type_definition, { desc = "LSP: Go to Type Definition" })

    map("n", "S", function() require('telescope.builtin').lsp_document_symbols() end, { desc = "LSP: Document Symbols" })
    map("n", "ra", function() require('nvchad.lsp.renamer')() end, { desc = "LSP: Rename" })
  end,
})
