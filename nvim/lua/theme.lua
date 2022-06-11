local set = vim.opt

set.termguicolors = true
set.background = "dark"
vim.cmd("colorscheme base16-hopscotch")
vim.cmd("hi Normal guibg=NONE")

set.number = true
set.relativenumber = true
set.colorcolumn = { "50", "72", "80", "100" }
