local keymap = vim.keymap -- for conciseness

-- general keymaps

-- to easy exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear /<search>
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- for increment/decrement of numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
