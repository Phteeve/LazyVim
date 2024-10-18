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

function custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    local line_text = vim.fn.substitute(line, '\\v%V(.)', '\\1', 'g') -- Remove leading whitespace

    -- Adjust this line to customize how you want your fold text to look
    return string.format('%s [ %d lines ]', line_text, line_count)
end

-- Set fold text expression
vim.opt.foldtext = 'v:lua.custom_fold_text()'
-- vim.o.foldlevel = 99
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- vim.o.numberwidth = 1

vim.cmd('set nocompatible')
vim.cmd('set noshowmode')
vim.cmd("set fillchars+=vert:\\ ")
vim.opt.fillchars:append({fold = " "})

-- vim.o.ai = true
-- vim.o.tags = 'tags;/'
-- vim.o.commentstring='#\\ %s'
