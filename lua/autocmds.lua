local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set






autocmd("BufWritePre", {
	desc = "Automatically create parent directories if they don't exist when saving a file",
	callback = function(args)
		vim.lsp.buf.format()

		local dir = vim.fn.fnamemodify(vim.uv.fs_realpath(args.match) or args.match, ":p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})




-- Setup autocmd for LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		map("n", "ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })

		map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to Declaration" })
		map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })

		map("n", "S", "<cmd>Pick lsp scope='document_symbol'<CR>", { desc = "LSP: Document Symbols" })
		map("n", "ra", vim.lsp.buf.rename, { desc = "LSP: Rename" })
	end,
})


vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L"
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.buftype == "terminal" then
			vim.cmd("startinsert")
		end
	end,
})
