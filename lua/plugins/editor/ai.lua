return {
  "CopilotC-Nvim/CopilotChat.nvim",
  cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatClose", "CopilotChatToggle", "CopilotChatStop", "CopilotChatReset", "CopilotChatSave", "CopilotChatLoad", "CopilotChatPrompts", "CopilotChatModels", "CopilotChatAgents" },
  dependencies = {
    { "zbirenbaum/copilot.lua", event = "InsertEnter" },
    { "nvim-lua/plenary.nvim",  branch = "master" }, -- for curl, log and async functions
  },
  build = "make tiktoken",                          -- Only on MacOS or Linux
  opts = {
    -- See Configuration section for options
  },
}
