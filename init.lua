vim.g.mapleader = " "

local mini_path = vim.fn.stdpath('data') .. '/site/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
	vim.fn.system({'git', 'clone', '--filter=blob:none', 'https://github.com/nvim-mini/mini.nvim', mini_path})
	vim.cmd 'packadd mini.nvim | helptags ALL'
end

require "mini.deps".setup { path = { package = path_package } }
local add, later = MiniDeps.add, MiniDeps.later

later(function()
	add "neovim/nvim-lspconfig"
	add "mason-org/mason.nvim"
	add "mason-org/mason-lspconfig.nvim"
	add "saghen/blink.cmp"

	add { source = "rose-pine/neovim", name = "rose-pine" }
	add "nvim-treesitter/nvim-treesitter"

	vim.opt.clipboard = "unnamedplus"
	vim.opt.cmdheight = 0
	vim.opt.inccommand = "split"
	vim.opt.laststatus = 3
	vim.opt.relativenumber = true
	vim.opt.shiftwidth = 2
	vim.opt.tabstop = 2
	vim.opt.undofile = true
	vim.opt.whichwrap:append "<>[]hl"

	vim.diagnostic.config { virtual_text = true }

	--==============================================================================
	-- Keymaps
	--==============================================================================
	local map  = function(modes, lhs, rhs, opts)
		if opts then vim.keymap.set(modes, lhs, rhs, vim.tbl_extend("force", { noremap = true, silent = true }, opts)) end
	end

	map({ "n", "x" }, "c", "\"_c", { desc = "Cut without yanking" })
	map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
	map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
	map("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
	map("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })

	map("t", "<Esc>", "<C-\\><C-n>")

	map("n", "<C-/>", ":split | resize -15 | terminal<CR>", { desc = "Open horizontal terminal" })
	map("n", "<leader>bd", "<CMD>lua MiniBufremove.delete()<CR>", { desc = "Close current buffer" })
	map("n", "<leader>pv", "<cmd>Explore<cr>", { desc = "Open file explorer" })

	map("n", "<Tab>", "<CMD>Pick buffers<CR>", { desc = "Switch buffers" })

	--==============================================================================
	-- Plugins
	--==============================================================================
	require "rose-pine".setup { styles = { transparency = true } }
	vim.cmd.colorscheme "rose-pine"

	require "mason".setup {}
	require "mason-lspconfig".setup(require "configs.mason")

	require "mini.icons".setup {}
	require "mini.bufremove".setup {}
	require "mini.pairs".setup {}
	require "mini.tabline".setup {}

	require "blink.cmp".setup(require "configs.cmp")
	require "nvim-treesitter.configs".setup(require "configs.treesitter")
end)


vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	desc = "ensure parent directory exists",
	callback = function(args)
		vim.lsp.buf.format()
		local dir = vim.fn.fnamemodify(vim.uv.fs_realpath(args.match) or args.match, ":p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	desc = "Setup LSP keymaps on attach",
	callback = function(e)
		local map = vim.keymap.set
		map("n", "da", vim.diagnostic.setqflist, {buffer = e.buf, desc = "LSP: Diagnostics"})
		map("n", "rr", vim.lsp.buf.references, { buffer = e.buf, desc = "LSP: References" })
		map("n", "S", vim.lsp.buf.document_symbol, { buffer = e.buf, desc = "LSP: Symbols" })
		map("n", "ca", vim.lsp.buf.code_action, { buffer = e.buf, desc = "LSP: Code Action" })
		map("n", "gD", vim.lsp.buf.declaration, { buffer = e.buf, desc = "LSP: Go to Declaration" })
		map("n", "gd", vim.lsp.buf.definition, { buffer = e.buf, desc = "LSP: Go to Definition" })
		map("n", "ra", vim.lsp.buf.rename, { buffer = e.buf, desc = "LSP: Rename" })
	end,
})
