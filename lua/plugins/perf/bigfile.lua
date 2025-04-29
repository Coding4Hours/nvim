return {
	"LunarVim/bigfile.nvim",
	event = "BufReadPre", -- this ensures it kicks in before the file is read
	config = function()
		require("bigfile").setup({
			filesize = 2, -- MiB threshold
			pattern = { "*" },
		})
	end,
}
