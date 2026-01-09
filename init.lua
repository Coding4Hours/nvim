local vim = vim

vim.g.mapleader = " "



vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim",                name = "rose-pine" },
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/ingur/floatty.nvim",
	-- tiny.nvim
	"https://github.com/nvim4hours/tiny.basics",
	"https://github.com/nvim4hours/tiny.treesitter",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }
})



vim.keymap.set("n", "da", vim.diagnostic.setqflist, { desc = "LSP: Diagnostics" })
vim.keymap.set("n", "rr", vim.lsp.buf.references, { desc = "LSP: References" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to Declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
vim.keymap.set("n", "ra", vim.lsp.buf.rename, { desc = "LSP: Rename" })



vim.keymap.set({ "n", "x" }, "c", '"_c', { desc = "Cut without yanking" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>d", "_\"dd", { desc = "Delete without copying" })
vim.keymap.set("n", "<leader>loc", "<CMD>!cat % | wc -l<CR>", { desc = "Current LOC" })
vim.keymap.set("n", "<leader>x", "<CMD>!chmod +x %<CR>", { desc = "Make file executable" })

local augroup = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	desc = "Format on save and ensure parent directory exists",
	callback = function(args)
		vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 500 })
	end,
})


require("mason").setup {}
require("mason-lspconfig").setup {}

for _, name in ipairs({ "tabline", "icons", "surround", "pairs", "completion", "snippets", "cmdline" }) do
	if name == "cmdline" then
		require("mini.cmdline").setup {
			autocomplete = {
				enable = false
			}
		}
	elseif name == "snippets" then
		require("mini.snippets").setup({
			directory = vim.fn.stdpath("config") .. "/snippets",
		})
	else
		require("mini." .. name).setup({})
	end
end

vim.keymap.set('i', '<Tab>', "vim.fn['mini#snippets#expand_or_next']()", { expr = true, silent = true })
vim.keymap.set('i', '<S-Tab>', "vim.fn['mini#snippets#jump_prev']()", { expr = true, silent = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	pattern = "*",
	callback = function()
		vim.hl.on_yank()
	end,
})




require("rose-pine").setup({ styles = { transparency = true } })
vim.cmd.colorscheme("rose-pine")

local term = require("floatty").setup({
	window = {
		row = function() return vim.o.lines - 11 end,
		width = 1.0,
		height = 8,
	},
})

vim.keymap.set({ 'n', 't' }, '<C-/>', function() term.toggle() end)

require("tiny.basics").setup()
require("tiny.treesitter").setup()
