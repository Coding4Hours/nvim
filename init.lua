vim.g.mapleader = " "

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.inccommand = "split"
vim.opt.laststatus = 3
vim.opt.undofile = true
vim.opt.whichwrap:append("<>[]hl")
vim.g.loaded_matchparen = 1

vim.defer_fn(function()
	vim.pack.add({
		{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
		"https://github.com/nvim-mini/mini.nvim",
		"https://github.com/neovim/nvim-lspconfig",
		"https://github.com/mason-org/mason.nvim",
		"https://github.com/mason-org/mason-lspconfig.nvim",
		"https://github.com/saghen/blink.cmp",
		"https://github.com/nvim-treesitter/nvim-treesitter",
		"https://github.com/dstein64/vim-startuptime",
	})

	require("rose-pine").setup({ styles = { transparency = true } })
	vim.cmd.colorscheme("rose-pine")
	vim.diagnostic.config({ virtual_text = true })

	local map = vim.keymap.set


	map("n", "da", vim.diagnostic.setqflist, { desc = "LSP: Diagnostics" })
	map("n", "rr", vim.lsp.buf.references, { desc = "LSP: References" })
	map("n", "S", vim.lsp.buf.document_symbol, { desc = "LSP: Symbols" })
	map("n", "ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
	map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to Declaration" })
	map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
	map("n", "ra", vim.lsp.buf.rename, { desc = "LSP: Rename" })

	map({ "n", "x" }, "c", '"_c', { desc = "Cut without yanking" })
	map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
	map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
	map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
	map("n", "<leader>bd", "<CMD>lua MiniBufremove.delete()<CR>", { desc = "Close current buffer" })
	map("n", "!", ":!", {})
	map("n", "<leader>loc", "<CMD>!cat % | wc -l<CR>", { desc = "Current LOC" })
	map("n", "<leader>x", "<CMD>!chmod +x %<CR>", { desc = "Make file executable" })

	local augroup = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		desc = "Format on save and ensure parent directory exists",
		callback = function(args)
			vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 500 })
			local dir = vim.fn.fnamemodify(vim.uv.fs_realpath(args.match) or args.match, ":p:h")
			if not vim.fn.isdirectory(dir) then
				vim.fn.mkdir(dir, "p")
			end
		end,
	})

	require("mason").setup({})
	require("mason-lspconfig").setup(require("configs.mason"))
	require("nvim-treesitter.configs").setup(require("configs.treesitter"))
	require("blink.cmp").setup(require("configs.cmp"))

	for _, name in ipairs({ "tabline", "icons", "bufremove", "surround", "pairs" }) do
		require("mini." .. name).setup({})
	end

	map("n", "<leader>?", function()
		local keymaps = {}
		local modes = {
			n = "Normal",
			i = "Insert",
			v = "Visual",
			x = "Visual Block",
			s = "Select",
			o = "Operator-pending",
			t = "Terminal",
			c = "Command",
		}
		for mode, name in pairs(modes) do
			for _, keymap in ipairs(vim.api.nvim_get_keymap(mode)) do
				table.insert(keymaps, string.format("%-16s | %-10s | %s", name, keymap.lhs, keymap.rhs))
			end
		end
		vim.fn.setqflist(keymaps, "r", "All Keymaps")
		vim.cmd("copen")
	end, { desc = "Show all keymaps" })
end, 1)
