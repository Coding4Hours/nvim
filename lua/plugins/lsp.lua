return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
  },

-- mason
{
  "williamboman/mason.nvim",
  version = "^1.0.0",
  cmd = { "Mason" },
  event = "User FilePost",
  opts = {},
},

-- mason-lspconfig
{
  "williamboman/mason-lspconfig.nvim",
  version = "^1.0.0",
  event = "User FilePost",
  opts = {
    ensure_installed = {
      "lua_ls",
      "jsonls",
      "gopls",
      "yamlls",
      "tailwindcss",
      "marksman",
      "bashls",
    },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup {}
        end
    },
    automatic_installation = true,
  }
},

-- mason-tool-installer (for formatters/linters)
{
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "User FilePost",
  cmd = {
    "MasonToolsClean",
    "MasonToolsInstall",
    "MasonToolsInstallSync",
    "MasonToolsUpdate",
    "MasonToolsUpdateSync",
  },
  opts = {
    ensure_installed = {
      -- formatters
      "stylua",
      "prettier",
      "biome",
      "goimports",
      "taplo",

      -- linters
      "luacheck",
      "markdownlint",
      "golangci-lint",
      "yamllint",
    },
  },
},


  
	-- Java Support
	{
		"nvim-java/nvim-java",
		ft = "java",
		config = function()
			require("java").setup({
				jdk = {
					auto_install = false,
				},
			})
			require("lspconfig").jdtls.setup({})
		end,
	},

	 {
  "aznhe21/actions-preview.nvim",

		opts = {},
		event = "LspAttach",
},

}
