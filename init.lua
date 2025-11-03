local vim = vim

vim.g.mapleader = " "

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.nu = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.inccommand = "split"
vim.o.laststatus = 3
vim.o.wrap = false
vim.o.undofile = true
vim.o.whichwrap = vim.o.whichwrap .. "<>[]hl"

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/nvim-treesitter/nvim-treesitter",
})



require("rose-pine").setup({ styles = { transparency = true } })
vim.cmd.colorscheme("rose-pine")
vim.diagnostic.config({ virtual_text = true })

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

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" }, -- still needed
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		if ft:match("blink%-cmp") then
			return
		end
		print "was not blink"

		vim.treesitter.start()
	end,
})
vim.api.nvim_create_autocmd("BufReadPre", {
	desc = "load blink.cmp",
	pattern = "*",
	callback = function()
		require("nvim-treesitter.configs").setup {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true }
		}


		require("blink.cmp").setup {
			fuzzy = {
				implementation = "prefer_rust",
				prebuilt_binaries = { force_version = "1.*" }
			},
			snippets = {
				opts = {
					search_paths = { vim.fn.stdpath("config") .. "/snippets" },
				},
			},

			keymap = {
				preset = "enter",
			}
		}

		require("mason").setup {}
		require("mason-lspconfig").setup {}
	end,
})

for _, name in ipairs({ "tabline", "icons", "surround", "pairs" }) do
	require("mini." .. name).setup({})
end
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	pattern = "*",
	callback = function()
		vim.hl.on_yank()
	end,
})
