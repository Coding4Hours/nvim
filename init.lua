vim.g.mapleader = " "
local vim = vim

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

--==============================================================================
-- Plugins
--==============================================================================

local add, later = MiniDeps.add, MiniDeps.later



later(function()
	add('nvim-lualine/lualine.nvim')
	add('saghen/blink.cmp')
	add('mason-org/mason-lspconfig.nvim')
	add('mason-org/mason.nvim')
	add("shortcuts/no-neck-pain.nvim")
	add('neovim/nvim-lspconfig')

	add({ source = "rose-pine/neovim", name = "rose-pine" })
	add({
		source = 'nvim-treesitter/nvim-treesitter',
		checkout = 'main',
	})
	local autocmd = vim.api.nvim_create_autocmd
	local map = vim.keymap.set

	--==============================================================================
	-- Initialization
	--==============================================================================
	require("rose-pine").setup({
		styles = {
			transparency = true,
		},
	})
	vim.cmd.colorscheme "rose-pine"

	require('mason').setup({})
	require('mason-lspconfig').setup(require('configs.mason'))





	require('mini.notify').setup()
	require("mini.pairs").setup()
	require("mini.extra").setup()
	require('mini.statusline').setup {}
	require("mini.pick").setup {
		options = { use_cache = true },
		window = {
			prompt_prefix = "   ",
		},
	}

	require("no-neck-pain").setup {}

	require('blink.cmp').setup(require('configs.cmp'))

	vim.ui.select = MiniPick.ui_select


	-- why does it copy when i wanna delete?
	map({ "n", "x" }, "c", '"_c')
	map({ "n", "x" }, "<leader>d", '"_d')


	-- telescope
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

	-- Misc.
	map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
	map("n", ";", ":", { noremap = true })


	-- Random stuff
	map("n", "<C-d>", "<C-d>zz", { desc = "PgDn" })
	map("n", "<C-u>", "<C-u>zz", { desc = "PgUp" })

	map({ 'n', 'v' }, 'B', '0', { noremap = true })
	map({ 'n', 'v' }, 'E', '$', { noremap = true })



	map('n', 'ht', ':split | resize -15 | terminal<CR>', { silent = true })


	map('n', '<leader>bd', '<CMD>bdelete!<CR>', { silent = true })

	map("n", "<leader>?", "<cmd>Pick keymaps<CR>", { desc = "keymap help" })
	map("n", "<leader>fd", "<cmd>Pick diagnostics<CR>", { desc = "Diagnostics" })
	map("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Grep" })
	map("n", "<Tab>", "<CMD>Pick buffers<CR>", { desc = "Tabs" })
	map("n", "ff", "<cmd>Pick files<CR>", { desc = "Files" })


	vim.keymap.set("n", "n", "nzzzv")
	vim.keymap.set("n", "N", "Nzzzv")








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

	map("n", "<leader>pv", "<cmd>Sexplore<cr>", {})


	vim.loader.enable()
	vim.opt.inccommand = "split"

	vim.opt.showtabline = 2
	vim.opt.cmdheight = 0
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.laststatus = 3
	vim.opt.smoothscroll = true
	vim.opt.smartindent = true
	vim.opt.ignorecase = true
	vim.opt.undofile = true

	vim.opt.relativenumber = true
	vim.opt.number = true
	vim.opt.signcolumn = "yes"



	vim.opt.clipboard = "unnamedplus"
	-- go to previous/next line with h,l,left arrow and right arrow
	-- when cursor reaches end/beginning of line
	vim.opt.whichwrap:append("<>[]hl")

	vim.diagnostic.config { virtual_text = true }
end)
