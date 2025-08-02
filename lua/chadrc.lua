-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "tokyonight",
	transparency = false,
}

M.tabufline = {
	enabled = true,
	lazyload = true,
}

M.nvdash = {
	load_on_startup = true,
	header = {
		"       █████╗ ██╗   ██╗██████╗  █████╗           Z",
		"      ██╔══██╗██║   ██║██╔══██╗██╔══██╗       Z   ",
		"      ███████║██║   ██║██████╔╝███████║    z      ",
		"      ██╔══██║██║   ██║██╔══██╗██╔══██║ z         ",
		"      ██║  ██║╚██████╔╝██║  ██║██║  ██║           ",
		"      ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝           ",
		"                                                  ",
	},

	buttons = {
		{
			txt = "  Find File",
			keys = "f",
			cmd = ":lua Snacks.dashboard.pick('files')",
		},
		{ txt = "  New File", keys = "n", cmd = ":ene | startinsert" },
		{
			txt = "  Find Text",
			keys = "g",
			cmd = ":lua Snacks.dashboard.pick('live_grep')",
		},
		{
			txt = "  Recent Files",
			keys = "r",
			cmd = ":lua Snacks.dashboard.pick('oldfiles')",
		},

		{ txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
		{
			txt = "  Config",
			keys = "c",
			cmd = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
		},
		{
			txt = "󰒲  Lazy",
			keys = "l",
			cmd = ":Lazy",
		},
		{ txt = "  Quit", keys = "q", desc = "Quit", cmd = ":qa" },

		{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

		{
			txt = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime) .. " ms"
				return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
			end,
			hl = "NvDashFooter",
			no_gap = true,
		},

		{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
	},
}

M.lsp = { signature = true }

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true }
}

-- Enabling nvdash will cause problems on dashboard!
-- M.nvdash = { load_on_startup = true }

-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
