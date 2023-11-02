local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

local function mysplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = ""
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		t = str
	end
	return os.date("%d%Y%I%M%S%p-") .. t
end

local function my_custom_trash_windows(bufnr)
	local api = require("nvim-tree.api")
	local lib = require("nvim-tree.lib")
	local utils = require("nvim-tree.utils")
	api.config.mappings.default_on_attach(bufnr)

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))

	local function custom_trash()
		local function on_exit(job_id, data, event)
			lib.refresh_tree()
		end
		local node = lib.get_node_at_cursor()
		if node then
			-- print("C:\\neovim-delete-files\\" .. mysplit(node.absolute_path, "\\"))
			-- print(node.absolute_path .. '"C:\\neovim-delete-files\\"')
			-- vim.fn.jobstart("$Recycle.Bin")
			local prompt_select = "Trash " .. node.name .. "?"
			local prompt_input, items_short, items_long
			prompt_input = prompt_select .. " y/N: "
			items_short = { "", "n" }
			items_long = { "Yes", "No" }

			lib.prompt(prompt_input, prompt_select, items_short, items_long, function(item_short)
				utils.clear_prompt()
				if item_short == "y" then
					os.rename(node.absolute_path, "C:\\neovim-deleted-files\\" .. mysplit(node.absolute_path, "\\"))
					print("File moved to neovim-deleted-files")
				end
			end)
		end
	end

	vim.keymap.set("n", "d", custom_trash, opts("CustomTrash"))
	vim.keymap.set("n", "D", custom_trash, opts("CustomTrash"))
end

-- configure nvim-tree
nvimtree.setup({
	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
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
	-- 	git = {
	-- 		ignore = false,
	-- 	},
	on_attach = my_custom_trash_windows,
})
