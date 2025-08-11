dofile(vim.g.base46_cache .. "mason")

return {
	ensure_installed = {

		"lua_ls",
		"jsonls",
		"gopls",
		"yamlls",
		"tailwindcss",
		"marksman",
		"bashls",
		"jdtls",
	},
	automatic_enable = true,
}
