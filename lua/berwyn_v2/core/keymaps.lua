local keymap = vim.keymap -- for conciseness
-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- for easy indentions and outdentions
keymap.set("n", "<lt>", "<lt><lt>", { silent = true, desc = "Outdent" })
keymap.set("n", ">", ">>", { silent = true, desc = "Indent" })
keymap.set("v", "<lt>", "<lt>gv", { silent = true, desc = "Indent" })
keymap.set("v", ">", ">gv", { silent = true, desc = "Indent" })

-- harpoon config
keymap.set("n", "<leader><leader>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
keymap.set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", {})
keymap.set("n", "<A-1>", ":lua require('harpoon.ui').nav_file(1)<CR>", {})
keymap.set("n", "<A-2>", ":lua require('harpoon.ui').nav_file(2)<CR>", {})
keymap.set("n", "<A-3>", ":lua require('harpoon.ui').nav_file(3)<CR>", {})
keymap.set("n", "<A-4>", ":lua require('harpoon.ui').nav_file(4)<CR>", {})
keymap.set("n", "<A-n>", ":lua require('harpoon.ui').nav_next()<CR>", {})
keymap.set("n", "<A-p>", ":lua require('harpoon.ui').nav_prev()<CR>", {})
keymap.set("n", "<leader>c", ":lua require('harpoon.mark').clear_all()<CR>", {})
