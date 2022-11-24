local set = vim.opt

set.termguicolors = true
set.background = "dark"

vim.cmd("hi Normal guibg=NONE")

set.number = true
set.relativenumber = true
set.colorcolumn = { "50", "72", "80", "100" }

vim.cmd("au WinLeave * set nocursorline")
vim.cmd("au WinEnter * set cursorline")
