local map = vim.api.nvim_set_keymap

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
