return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local toggleterm = require("toggleterm")
			toggleterm.setup({
				-- open_mapping = [[<c-j>]],
				size = 20,
				start_in_insert = false,
				close_on_exit = true,
			})

			local keymap = vim.keymap -- for conciseness
			keymap.set("n", "<leader>jj", ":ToggleTerm<cr>")
		end,
	},
}
