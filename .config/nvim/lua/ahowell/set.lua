vim.opt.guicursor = "" -- Use thick cursor

vim.opt.nu = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Use undotree to handle undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false -- Don't highlight all matches
vim.opt.incsearch = true -- Show current match string so far

vim.opt.termguicolors = true

vim.opt.scrolloff = 8 -- Cursoring up always leaves at least 8 lines above cursor
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
