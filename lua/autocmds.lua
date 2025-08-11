local autocmd = vim.api.nvim_create_autocmd
vim.deprecate = function() end

autocmd("BufWritePre", {
	desc = "Automatically create parent directories if they don't exist when saving a file",
	callback = function(args)
		vim.lsp.buf.format()
		local buf_is_valid_and_listed = vim.api.nvim_buf_is_valid(args.buf) and vim.bo[args.buf].buflisted

		if buf_is_valid_and_listed then
			vim.fn.mkdir(vim.fn.fnamemodify(vim.uv.fs_realpath(args.match) or args.match, ":p:h"), "p")
		end
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	desc = "setup",
	callback = function()
		require("mini.surround").setup({})
		require("mini.pairs").setup({})
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	desc = "setup",
	callback = function()
		require("mini.notify").setup({
			lsp_progress = {
				enable = false,
			},
		})
	end,
})

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
			vim.api.nvim_del_augroup_by_name("NvFilePost")

			vim.schedule(function()
				vim.api.nvim_exec_autocmds("FileType", {})
			end)
		end
	end,
})

autocmd("User", {
	pattern = "MiniFilesActionRename",
	callback = function(event)
		Snacks.rename.on_rename_file(event.data.from, event.data.to)
	end,
})

autocmd({ "VimEnter", "BufReadPost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("NvFilePre", { clear = true }),
	callback = function(args)
		local file = vim.api.nvim_buf_get_name(args.buf)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

		if not vim.g.ui_entered and args.event == "VimEnter" then
			vim.g.ui_entered = true
		end

		if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
			vim.api.nvim_exec_autocmds("User", { pattern = "FilePre", modeline = false })
			vim.api.nvim_del_augroup_by_name("NvFilePre")

			vim.schedule(function()
				vim.api.nvim_exec_autocmds("FileType", {})
			end)
		end
	end,
})
