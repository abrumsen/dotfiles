vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
