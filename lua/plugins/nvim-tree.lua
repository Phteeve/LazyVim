return {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  config = function()
    local function get_centered_window_position()
      local editor_width = vim.api.nvim_get_option("columns")
      local editor_height = vim.api.nvim_get_option("lines")

      local width = 100
      local height = 40

      local row = math.floor((editor_height - height) / 2)
      local col = math.floor((editor_width - width) / 2)

      return row, col
    end

    local row, col = get_centered_window_position()

    require('nvim-tree').setup {

      view = {
        float = {
          enable = true,           -- Enable floating window
          open_win_config = {
            relative = 'editor',
            border = 'rounded',
            width = 100,
            height = 40,
            row = row,              -- Centered row position
            col = col,              -- Centered col position
          },
        },
        width = 40,                -- Set the width of the tree panel
        side = 'left',             -- This will be ignored in floating mode
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
