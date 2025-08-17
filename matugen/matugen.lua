local M = {}

local lighten = require("base46.colors").change_hex_lightness

M.base_30 = {
  white = "#e2e2e9",
  black = "#121318",
  darker_black = lighten("#121318", -3),
  black2 = lighten("#121318", 6),
  one_bg = lighten("#121318", 10),
  one_bg2 = lighten("#121318", 16),
  one_bg3 = lighten("#121318", 22),
  grey = "#44464f",
  grey_fg = lighten("#44464f", -10),
  grey_fg2 = lighten("#44464f", -20),
  light_grey = "#8f9099",
  red = "#ffb2b9",
  baby_pink = lighten("#ffb2b9", 10),
  pink = "#e0bbde",
  line = "#8f9099",
  green = "#95d5a7",
  vibrant_green = lighten("#95d5a7", 10),
  blue = "#b7c4ff",
  nord_blue = lighten("#b7c4ff", 10),
  yellow = "#b8cf84",
  sun = lighten("#b8cf84", 10),
  purple = "#e0bbde",
  dark_purple = lighten("#e0bbde", -10),
  teal = "#404659",
  orange = "#ffb2b9",
  cyan = "#82d3e2",
  statusline_bg = lighten("#121318", 6),
  pmenu_bg = "#44464f",
  folder_bg = lighten("#b0c6ff", 0),
  lightbg = lighten("#121318", 10),
}

M.base_16 = {
  base00 = "#121318",
  base01 = lighten("#44464f", 0),
  base02 = lighten("#44464f", 3),
  base03 = lighten("#8f9099", 0),
  base04 = lighten("#c5c6d0", 0),
  base05 = "#e2e2e9",
  base06 = lighten("#e2e2e9", 0),
  base07 = "#121318",
  base08 = "#ffb2b9",
  base09 = "#b8cf84",
  base0A = "#b7c4ff",
  base0B = "#95d5a7",
  base0C = "#82d3e2",
  base0D = lighten("#b7c4ff", 20),
  base0E = "#e0bbde",
  base0F = "#e2e2e9",
}

M.type = "dark"

M.polish_hl = {
  defaults = {
    Comment = {
      italic = true,
      fg = M.base_16.base03,
    },
  },
  Syntax = {
    String = {
      fg = "#e0bbde",
    },
  },
  treesitter = {
    ["@comment"] = {
      fg = M.base_16.base03,
    },
    ["@string"] = {
      fg = "#e0bbde",
    },
  },
}

return M
