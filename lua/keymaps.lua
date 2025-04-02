local map = vim.api.nvim_set_keymap

map('n', '<Esc>', ':nohl<CR>', { noremap = true, silent = true })
map("n", "<C-U>", "<C-U>zz", { silent = false })
map("n", "<C-D>", "<C-D>zz", { silent = false })
map("n", "<Tab>", "]b", { silent = true })
map("n", "<S-Tab>", "[b", { silent = true })
map("n", "<C-n>", "<leader>e", { silent = true })
map("n", "<leader>z", "<leader>bd", { silent = false })
map("", "w", "<Plug>CamelCaseMotion_w", { silent = true })
map("", "b", "<Plug>CamelCaseMotion_b", { silent = true })
map("", "e", "<Plug>CamelCaseMotion_e", { silent = true })

map("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
map("n", "<leader>z", ":bd<CR>", { noremap = true, silent = true })

map('v', '>', '>gv', { noremap = true, silent = true })
map('v', '<', '<gv', { noremap = true, silent = true })

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {})
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {})
map("n", "gr", '<cmd>lua vim.lsp.buf.references()<CR>', {})
map("n", "K", '<cmd>lua vim.lsp.buf.hover()<CR>', {})
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {})

map("n", "<leader>e", "<cmd>EslintFixAll<CR>", { noremap = true, silent = true })
map("n", "<leader>fp", ":lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })

map('n', 'gr', ':Telescope lsp_references<CR>', { silent = true })

map('n', '<leader>fe', [[:lua YankDiagnosticError()<CR>]],
  { noremap = true, silent = true, desc = "Copy error" })

map('n', '<leader>ss', 'ysiw', {desc = "Vim Surround In Word"})

vim.api.nvim_set_keymap("n", "<leader>qn", ":cnext<CR>", { noremap = true, silent = true, desc = "Next quickfix item"})
vim.api.nvim_set_keymap("n", "<leader>qp", ":cprev<CR>", { noremap = true, silent = true, desc = "Previous quickfix item"})
vim.api.nvim_set_keymap("n", "<leader>qo", ":copen<CR>", { noremap = true, silent = true, desc = "Open quickfix item"})
vim.api.nvim_set_keymap("n", "<leader>qc", ":cclose<CR>", { noremap = true, silent = true, desc = "Close quickfix item"})

vim.api.nvim_set_keymap('n', '<Leader>ac', ':AvanteClear<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+ = expand("%:p")<CR>', { noremap = true, silent = true, desc = "Copy file path" })

function YankDiagnosticError()
  vim.diagnostic.open_float()
  vim.diagnostic.open_float()
end

