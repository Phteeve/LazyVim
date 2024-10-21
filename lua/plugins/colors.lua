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

      -- Clear the background for various GUI elements
      vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi NormalFloat guibg=NONE ctermbg=NONE]]) -- Floating windows
      vim.cmd([[hi FloatBorder guibg=NONE ctermbg=NONE]]) -- Floating window border
      vim.cmd([[hi SignColumn guibg=NONE ctermbg=NONE]]) -- Sign column
      vim.cmd([[hi StatusLine guibg=NONE ctermbg=NONE]]) -- Status line
      vim.cmd([[hi TabLine guibg=NONE ctermbg=NONE]]) -- Tab line
      vim.cmd([[hi LineNr guibg=NONE ctermbg=NONE]]) -- Line numbers
      vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]]) -- Non-text characters
      vim.cmd([[hi CursorLine guibg=NONE ctermbg=NONE]]) -- Cursor line
      vim.cmd([[hi Pmenu guibg=NONE ctermbg=NONE]]) -- Popup menu
      vim.cmd([[hi PmenuSel guibg=NONE ctermbg=NONE]]) -- Selected popup menu item

    end,
  },
}
