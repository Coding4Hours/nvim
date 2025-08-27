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
		map("n", "<leader>cs", "<cmd>lua Snacks.picker.lsp_symbols()<CR>",
			{ desc = "LSP: Document Symbols" })
		map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
		map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP: Rename" })

		map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to Declaration" })
		map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })

		map("n", "S", "<cmd>lua Snacks.picker.lsp_symbols()<CR>", { desc = "LSP: Document Symbols" })
		map("n", "ra", vim.lsp.buf.rename, { desc = "LSP: Rename" })
	end,
})
