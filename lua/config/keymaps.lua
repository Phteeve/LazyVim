local function keymap(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

keymap("n", "<C-U>", "<C-U>zz", { silent = false })
keymap("n", "<C-D>", "<C-D>zz", { silent = false })
keymap("n", "<Tab>", "]b", { silent = true })
keymap("n", "<S-Tab>", "[b", { silent = true })
keymap("n", "<C-n>", "<leader>e", { silent = true })
keymap("n", "<leader>z", "<leader>bd", { silent = false })
keymap("", "w", "<Plug>CamelCaseMotion_w", { silent = true })
keymap("", "b", "<Plug>CamelCaseMotion_b", { silent = true })
keymap("", "e", "<Plug>CamelCaseMotion_e", { silent = true })
