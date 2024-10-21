return {
  {
    "nyoom-engineering/oxocarbon.nvim", -- Add the Oxocarbon theme plugin
    lazy = false, -- Ensure it's loaded immediately
    priority = 1000, -- High priority to load the theme early
    config = function()
      -- Set background transparency
      vim.g.oxocarbon_disable_background = true

      -- Clear the background for various GUI elements
      vim.cmd([[
        colorscheme oxocarbon
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalNC guibg=NONE ctermbg=NONE
        hi NormalFloat guibg=NONE ctermbg=NONE
        hi NormalFloatNC guibg=NONE ctermbg=NONE
        hi FloatBorder guibg=NONE ctermbg=NONE
        hi FloatBorderNC guibg=NONE ctermbg=NONE
        hi SignColumn guibg=NONE ctermbg=NONE
        hi SignColumnNC guibg=NONE ctermbg=NONE
        hi StatusLine guibg=NONE ctermbg=NONE
        hi StatusLineNC guibg=NONE ctermbg=NONE
        hi TabLine guibg=NONE ctermbg=NONE
        hi TabLineNC guibg=NONE ctermbg=NONE
        hi LineNr guibg=NONE ctermbg=NONE
        hi LineNrNC guibg=NONE ctermbg=NONE 
        hi NonText guibg=NONE ctermbg=NONE
        hi NonTextNC guibg=NONE ctermbg=NONE
        hi CursorLine guibg=NONE ctermbg=NONE
        hi CursorLineNC guibg=NONE ctermbg=NONE
        hi Pmenu guibg=NONE ctermbg=NONE
        hi PmenuNC guibg=NONE ctermbg=NONE
        hi PmenuSel guibg=NONE ctermbg=NONE
        hi PmenuSelNC guibg=NONE ctermbg=NONE

        hi TelescopeNormal guibg=NONE ctermbg=NONE
        hi TelescopeBorder guibg=NONE ctermbg=NONE
        hi TelescopePromptNormal guibg=NONE ctermbg=NONE
        hi TelescopePromptBorder guibg=NONE ctermbg=NONE
        hi TelescopeResultsNormal guibg=NONE ctermbg=NONE
        hi TelescopeResultsBorder guibg=NONE ctermbg=NONE
        hi TelescopePreviewNormal guibg=NONE ctermbg=NONE
        hi TelescopePreviewBorder guibg=NONE ctermbg=NONE

        hi NvimTreeNormalFloat guibg=NONE
        hi NvimTreeNormalFloatNC guibg=NONE
      ]])
    end,
  },
}
