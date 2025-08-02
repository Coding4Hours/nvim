return {
  -- Notifications
  {
    "echasnovski/mini.notify",
    event = "User FilePost",
    opts = {
      lsp_progress = {
        enable = false
      }
    },
  },
	 
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    cmd = "NeoTree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
  },

	
  {
    "rose-pine/neovim",
    event = "VimEnter",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        varient = "moon",
        styles = {
          transparency = true,
        },
      })
      vim.cmd("colorscheme rose-pine")
    end
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      {
        "tiagovla/scope.nvim",
        opts = {}
      },
      {
        "nvim-tree/nvim-web-devicons",
        lazy = true
      },
    },
    event = "User FilePost",
    opts = {}
  },
	
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")



      dashboard.section.buttons.val = {
        dashboard.button("n", "  New File", ":ene | startinsert<CR>"),
        dashboard.button("f", "  Find File", ":lua Snacks.picker.files()<CR>"),
        dashboard.button("g", "  Find Text", ":lua Snacks.picker.grep()<CR>"),
        dashboard.button("r", "  Recent Files", ":lua Snacks.picker.recent()<CR>"),
        dashboard.button("c", "  Config", ":lua Snacks.picker.pick('files', {cwd = vim.fn.stdpath('config')})<CR>"),
        dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }


      alpha.setup(dashboard.config)
				      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },


  {
    'echasnovski/mini.statusline',
    event = "User FilePost",
    opts = {},
    version = '*'
  },  
}
