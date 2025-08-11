dofile(vim.g.base46_cache .. "whichkey")
return {
  defaults = {},
  spec = {
    ----- Groups -----
    { "<leader>c", group = "Code" },
    { "<leader>b", group = "Buffers" },
    { "<leader>f", group = "Find" },
    { "<leader>d", group = "Debugging" },
    { "<leader>t", group = "Tabs" },
  },
}
