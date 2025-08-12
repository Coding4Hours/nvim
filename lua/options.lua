vim.loader.enable()
local opt = vim.opt
local o = vim.o

opt.shortmess:append "sI"
o.showtabline = 2
o.cmdheight = 0
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.laststatus = 3
opt.smoothscroll = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
o.undofile = true

opt.relativenumber = true
opt.signcolumn = "yes"



opt.updatetime = 200
o.clipboard = "unnamedplus"
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
vim.opt.history = 50 -- Number of commands to remember in a history table (per buffer).

vim.diagnostic.config({
	virtual_text = true,
})

