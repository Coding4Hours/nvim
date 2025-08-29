vim.g.mapleader = " "

local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		'git', 'clone', '--filter=blob:none',
		'https://github.com/echasnovski/mini.nvim', mini_path
	}
	vim.fn.system(clone_cmd)
	vim.cmd('packadd mini.nvim | helptags ALL')
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })
local add, later = MiniDeps.add, MiniDeps.later


--==============================================================================
-- Plugin Declarations
--==============================================================================
later(function()
	add('neovim/nvim-lspconfig')
	add('mason-org/mason.nvim')
	add('mason-org/mason-lspconfig.nvim')
	add('saghen/blink.cmp')

	add('nvim-lualine/lualine.nvim')
	add({ source = "rose-pine/neovim", name = "rose-pine" })
	add("shortcuts/no-neck-pain.nvim")
	add({ source = 'nvim-treesitter/nvim-treesitter', checkout = 'main' })

	--==============================================================================
	-- Core Settings
	--==============================================================================
	vim.loader.enable()
	local opt = vim.opt

	opt.clipboard = "unnamedplus"
	opt.cmdheight = 0
	opt.ignorecase = true
	opt.inccommand = "split"
	opt.laststatus = 3
	opt.number = true
	opt.relativenumber = true
	opt.shiftwidth = 2
	opt.showtabline = 2
	opt.signcolumn = "yes"
	opt.smartindent = true
	opt.smoothscroll = true
	opt.tabstop = 2
	opt.undofile = true
	opt.whichwrap:append("<>[]hl")

	vim.diagnostic.config { virtual_text = true }

	--==============================================================================
	-- Keymaps
	--==============================================================================
	local map = function(modes, lhs, rhs, opts)
		local options = { noremap = true, silent = true }
		if opts then
			options = vim.tbl_extend("force", options, opts)
		end
		vim.keymap.set(modes, lhs, rhs, options)
	end

	map({ "n", "x" }, "c", '"_c', { desc = "Cut without yanking" })
	map({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
	map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
	map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
	map("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
	map("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
	map({ 'n', 'v' }, 'B', '0', { noremap = true, desc = "Go to beginning of line" })
	map({ 'n', 'v' }, 'E', '$', { noremap = true, desc = "Go to end of line" })
	map("n", "n", "nzzzv", { desc = "Next search result and center" })
	map("n", "N", "Nzzzv", { desc = "Previous search result and center" })
	map("n", ";", ":", { noremap = true })

	map("t", "<Esc>", "<C-\\><C-n>")

	map('n', 'ht', ':split | resize -15 | terminal<CR>', { desc = "Open horizontal terminal" })
	map('n', '<leader>bd', '<CMD>bdelete!<CR>', { desc = "Close current buffer" })
	map("n", "<leader>pv", "<cmd>Explore<cr>", { desc = "Open file explorer" })

	map("n", "<leader>?", "<cmd>Pick keymaps<CR>", { desc = "Show keymaps" })
	map("n", "<leader>fd", "<cmd>Pick diagnostics<CR>", { desc = "Show diagnostics" })
	map("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Live Grep" })
	map("n", "<Tab>", "<CMD>Pick buffers<CR>", { desc = "Switch buffers" })
	map("n", "ff", "<cmd>Pick files<CR>", { desc = "Find files" })

	--==============================================================================
	-- Plugin Setup
	--==============================================================================
	require("rose-pine").setup({ styles = { transparency = true } })
	vim.cmd.colorscheme "rose-pine"

	require('mason').setup({})
	require('mason-lspconfig').setup(require('configs.mason'))

	require('mini.notify').setup()
	require("mini.pairs").setup()
	require("mini.extra").setup()
	require('mini.statusline').setup()
	require("mini.pick").setup {
		options = { use_cache = true },
		window = { prompt_prefix = "   " },
	}
	vim.ui.select = MiniPick.ui_select

	require("no-neck-pain").setup {}
	require('blink.cmp').setup(require('configs.cmp'))

	--==============================================================================
	-- Autocommands
	--==============================================================================
	local autocmd = vim.api.nvim_create_autocmd
	local augroup = vim.api.nvim_create_augroup

	local lsp_group = augroup('UserLspConfig', {})
	local file_group = augroup('UserFileConfig', {})
	local window_group = augroup('UserWindowConfig', {})

	autocmd("BufWritePre", {
		group = file_group,
		desc = "Format on save and ensure parent directory exists",
		callback = function(args)
			vim.lsp.buf.format({ async = false })
			local dir = vim.fn.fnamemodify(vim.uv.fs_realpath(args.match) or args.match, ":p:h")
			if vim.fn.isdirectory(dir) == 0 then
				vim.fn.mkdir(dir, "p")
			end
		end,
	})

	autocmd("LspAttach", {
		group = lsp_group,
		desc = "Setup LSP keymaps on attach",
		callback = function(ev)
			map("n", "ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "LSP: Code Action" })
			map("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "LSP: Go to Declaration" })
			map("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "LSP: Go to Definition" })
			map("n", "ra", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP: Rename" })
		end,
	})

	autocmd("FileType", {
		group = window_group,
		pattern = "help",
		command = "wincmd L"
	})

	autocmd("BufEnter", {
		group = window_group,
		pattern = "*",
		callback = function()
			if vim.bo.buftype == "terminal" then
				vim.cmd("startinsert")
			end
		end,
	})
end)
