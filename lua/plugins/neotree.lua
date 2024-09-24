return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Optional for file icons
    "MunifTanjim/nui.nvim", -- Optional for floating windows
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        position = "float",
        width = 60, -- Adjust as needed
        height = 30, -- Adjust as needed
        float = {
          border = "rounded", -- Can be "none", "single", "double", etc.
        },
      },
    })
  end,
}
