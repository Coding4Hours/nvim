return {
  "beauwilliams/statusline.lua",
  event = { "BufReadPre", "BufNewFile" }, -- loads on UI startup
  config = function()
    local statusline = require('statusline')
    statusline.tabline = false
  end,
}

