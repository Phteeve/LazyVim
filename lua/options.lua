vim.g.lf_netrw = true

vim.g.mapleader = " "

-- vim.cmd('set autochdir')

-- vim.o.autochdir = true
vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.o.autoread = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hidden = true
vim.o.clipboard = 'unnamedplus'
vim.o.laststatus = 2
vim.o.shiftwidth = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.foldmethod = 'manual'
vim.o.foldcolumn = '0'
vim.o.statusline = '%t%m'
vim.o.number = true

vim.cmd('set nocompatible')
vim.cmd('set noshowmode')
vim.opt.fillchars:append({fold = " "})
