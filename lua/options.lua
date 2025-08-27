local vim = vim

vim.loader.enable()
vim.opt.inccommand = "split"

vim.opt.showtabline = 2
vim.opt.cmdheight = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.laststatus = 3
vim.opt.smoothscroll = true
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.undofile = true

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"



vim.opt.updatetime = 200
vim.opt.clipboard = "unnamedplus"
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

vim.diagnostic.config({
  virtual_text = true,
})
