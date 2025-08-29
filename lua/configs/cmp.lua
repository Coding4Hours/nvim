local opts = {
	appearance = { nerd_font_variant = "normal" },
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
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
	}
}

return opts
