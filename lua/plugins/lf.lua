return {
  "lmburns/lf.nvim",
  dependencies = {
    { 'akinsho/toggleterm.nvim' },
  },
  config = function()
    -- vim.g.lf_netrw = 1

    require("lf").setup({
      default_cmd = "IN_EDITOR=true lf",
      direction = "float", -- window type: float horizontal vertical
      border = "rounded",  -- border kind: single double shadow curved
      -- height = 80, -- 0.80, -- height of the *floating* window
      -- width = 70,-- 0.85, -- width of the *floating* window
      height = vim.fn.float2nr(vim.fn.round(0.85 * vim.o.lines)), -- height of the *floating* window
      width = vim.fn.float2nr(vim.fn.round(0.85 * vim.o.columns)),
      mappings = true,                                            -- whether terminal buffer mapping is enabled
      winblend = 0,
      -- default_command = "IN_EDITOR=true lf",
      highlights = {
        Normal = { guibg = "NONE" },
        NormalFloat = { guibg = "NONE" }
      }
    })

    vim.api.nvim_create_autocmd("User", {
      -- event = "User",
      pattern = "LfTermEnter",
      callback = function(a)
        vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", { nowait = true })
      end,
    })
  end,
}
