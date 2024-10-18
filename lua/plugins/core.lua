return {
	{ "tpope/vim-surround" },
	{ "tmhedberg/matchit" },
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
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
}
