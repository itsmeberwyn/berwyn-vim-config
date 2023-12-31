return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwplugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight nvimtreefolderarrowclosed guifg=#3fc5ff ]])
		vim.cmd([[ highlight nvimtreefolderarrowopen guifg=#3fc5ff ]])

		-- configure nvim-tree
		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".ds_store" },
			},
			git = {
				ignore = false,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "toggle file explorer" }) -- toggle file explorer
		keymap.set("n", "<leader>w", "<cmd>NvimTreeFocus<cr>", { desc = "focus on tab file" }) -- focus on file explorer
		-- keymap.set(
		-- 	"n",
		-- 	"<leader>ef",
		-- 	"<cmd>nvimtreefindfiletoggle<cr>",
		-- 	{ desc = "toggle file explorer on current file" }
		-- ) -- toggle file explorer on current file
		-- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<cr>", { desc = "collapse file explorer" }) -- collapse file explorer
		-- keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>", { desc = "refresh file explorer" }) -- refresh file explorer
	end,
}
