return {
  {
    "nyoom-engineering/oxocarbon.nvim", -- Add the Oxocarbon theme plugin
    lazy = false, -- Ensure it's loaded immediately
    priority = 1000, -- High priority to load the theme early
    config = function()
      -- Set background transparency
      vim.g.oxocarbon_disable_background = true
      -- Apply the theme
      vim.cmd([[colorscheme oxocarbon]])
    end,
  },
}
