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

opt.number = true
opt.signcolumn = "yes"

if vim.g.neovide then
	vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

opt.updatetime = 200
o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
vim.opt.history = 50 -- Number of commands to remember in a history table (per buffer).

vim.diagnostic.config({
	virtual_text = true,
})


    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
vim.g.loaded_editorconfig = 1
vim.g.loaded_gzip  = 1
vim.g.loaded_man  = 1
vim.g.loaded_matchit  = 1
vim.g.loaded_matchparen  = 1
vim.g.loaded_netrwPlugin  = 1
vim.g.loaded_osc52  = 1
vim.g.loaded_rplugin  = 1
vim.g.loaded_shada  = 1
vim.g.loaded_spellfile  = 1
vim.g.loaded_tarPlugin  = 1
vim.g.loaded_tohtml = 1
vim.g.loaded_tutor  = 1
vim.g.loaded_zipPlugin = 1
