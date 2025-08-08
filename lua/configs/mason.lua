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
	},
	-- handlers = {
	--     function(server_name)
	--         require("lspconfig")[server_name].setup {}
	--     end
	-- },
	automatic_enable = true,
}
