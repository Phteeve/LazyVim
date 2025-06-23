return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "kkharji/sqlite.lua", module = "sqlite" },
  },
  config = function()
    local actions = require("telescope.actions")

    vim.opt.clipboard = "unnamedplus"

    require("neoclip").setup({
      history = 1000,
      enable_persistent_history = true,
      enable_clipboard = true,
      continuous_sync = true,
      -- Pass telescope mappings for neoclip picker:
      keys = {
        telescope = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    })

    require("telescope").load_extension("neoclip")

    vim.keymap.set("n", "<leader>fp", "<cmd>Telescope neoclip<CR>", { desc = "Clipboard history (neoclip)" })
  end,
}
