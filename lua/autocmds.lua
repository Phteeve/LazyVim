vim.cmd[[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=400})
  augroup END
]]

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "if search('\\r', 'n') | %s/\\r//g | endif",
})
