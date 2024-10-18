return {
	"bkad/CamelCaseMotion",
	config = function()
		-- vim.g.camelcasemotion_key = ','
		vim.api.nvim_set_keymap("", "w", "<Plug>CamelCaseMotion_w", { silent = true })
		vim.api.nvim_set_keymap("", "b", "<Plug>CamelCaseMotion_b", { silent = true })
		vim.api.nvim_set_keymap("", "e", "<Plug>CamelCaseMotion_e", { silent = true })
		vim.api.nvim_set_keymap("", "W", "w", { noremap = true })
		vim.api.nvim_set_keymap("", "B", "b", { noremap = true })
		vim.api.nvim_set_keymap("", "E", "e", { noremap = true })
	end,
}
