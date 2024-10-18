return {
	{ "tpope/vim-surround" },
	{ "dyng/ctrlsf.vim" },
	{ "gioele/vim-autoswap" },
	{ "tpope/vim-eunuch" },
	{ "rbgrouleff/bclose.vim" },
	{ "junegunn/fzf" },
	{ "junegunn/fzf.vim" },
	{ "maxmx03/solarized.nvim" },
	{ "andreypopp/vim-colors-plain" },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup{
        options = {
          numbers = "buffer_id", -- shows buffer index
          diagnostics = "nvim_lsp", -- show LSP diagnostics in the bufferline
          separator_style = "slant", -- or "padded_slant"
          show_buffer_close_icons = false,
          show_close_icon = false,
          offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }},
        }
      }
    end,
  },
	{
		{
			"kdheepak/lazygit.nvim",
			cmd = {
				"LazyGit",
				"LazyGitConfig",
				"LazyGitCurrentFile",
				"LazyGitFilter",
				"LazyGitFilterCurrentFile",
			},
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			keys = {
				{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
			},
		},
	},
	{
		"sangdol/mintabline.vim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"junegunn/vim-easy-align",
	},
	{
		"willothy/wezterm.nvim",
	},
	{
		"milisims/foldhue.nvim",
		config = function()
			require("foldhue").fade = function(h1)
				return h1
			end

			require("foldhue").enable()
		end,
	},
	{
		"folke/flash.nvim",
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
}
