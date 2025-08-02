return {
  {
    "numToStr/FTerm.nvim",
    desc = "🔥 No-nonsense floating terminal plugin for neovim 🔥",
    opts = {},
    keys = {
			{ "<leader>ft", "<cmd>lua require('fterm').toggle()<cr>", desc = "Terminal" },
    },
    lazy = true,
  }
}
