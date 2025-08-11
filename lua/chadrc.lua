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
	lazyload = false,
}

M.lsp = { signature = true }

M.colorify = {
	enabled = true,
	mode = "virtual", -- fg, bg, virtual
	virt_text = "󱓻 ",
	highlight = { hex = true, lspvars = true },
}

-- Enabling nvdash will cause problems on dashboard!
-- M.nvdash = { load_on_startup = true }

return M
