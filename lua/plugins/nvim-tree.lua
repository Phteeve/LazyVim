return {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  config = function()
    require('nvim-tree').setup {

      view = {
        float = {
          enable = true,           -- Enable floating window
          open_win_config = {
            relative = 'editor',
            border = 'rounded',    -- You can change this to 'single', 'double', 'shadow', etc.
            width = 40,            -- Set width of the floating window
            height = 30,           -- Set height of the floating window
            row = 1,               -- Vertical positioning (0 = top)
            col = 1,               -- Horizontal positioning (0 = left)
          },
        },
        width = 40,                 -- Set the width of the tree panel
      },
      -- Do not show git ignored files
      git = {
        enable = true,
        ignore = false,
      },
      
      -- Enable diagnostics (like LSP warnings and errors) in the tree
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },

      -- Update the tree when changing working directory
      update_cwd = true,

      -- Show LSP symbols in the sidebar
      view = {
        width = 30,
        side = 'left',
      },

      -- Actions for opening and closing nodes
      actions = {
        open_file = {
          resize_window = true,
          quit_on_open = true,
        },
      },

      -- Custom icons for folders and files
      renderer = {
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
            },
          },
        },
      },
    }

    -- Optional: Keybindings for easier tree navigation
    vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
  end
}
