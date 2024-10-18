return {
	"nvim-telescope/telescope.nvim",
	dependencies = { { "nvim-lua/plenary.nvim" } }, -- Required dependency
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- Default configuration for telescope goes here:
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "🔍 ",
				selection_caret = " ",
				path_display = { "truncate" },

				-- Key mappings for telescope actions
				mappings = {
					i = {
						["<C-u>"] = false, -- Disable clearing prompt in insert mode
						["<C-d>"] = false,
						["<Esc>"] = actions.close, -- Close with escape
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<CR>"] = actions.select_default + actions.center, -- Center results on selection
					},
				},
			},

			-- Pickers configuration: default options for specific pickers
			pickers = {
				find_files = {
					hidden = true, -- Show hidden files
				},
				live_grep = {
					additional_args = function()
						return { "--hidden" }
					end, -- Include hidden files in grep
				},
			},

			-- Extensions configuration
			extensions = {
				-- Example: fzf extension (if installed)
				fzf = {
					fuzzy = true, -- Fuzzy matching
					override_generic_sorter = true, -- Override the generic sorter
					override_file_sorter = true, -- Override the file sorter
					case_mode = "smart_case", -- Case mode
				},
			},
		})

		-- Optional keybindings for easier access
		vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
	end,
}
