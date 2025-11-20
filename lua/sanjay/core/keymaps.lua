-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Make 'x' act like 'd' but delete to black hole register
vim.api.nvim_set_keymap("n", "x", '"_d', { noremap = true, silent = false })

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
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tabwindow vertically

vim.keymap.set({ "n", "x", "s" }, "<leader>w", "<cmd>w<cr>", { desc = "Save File" }) -- normal, visual, select modes[6] - Save file

-- Normal mode: move line up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Insert mode: move line up/down
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- Visual mode: move selection up/down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Insert mode movement with Ctrl + j/k/h/l
vim.keymap.set("i", "<A-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<A-l>", "<Right>", { noremap = true })
vim.keymap.set("i", "<A-j>", "<Down>", { noremap = true })
vim.keymap.set("i", "<A-k>", "<Up>", { noremap = true })

-- Navigate to previous file in jump list
vim.keymap.set("n", "<c-o>", "<c-o>", { desc = "go to previous jump" })

-- navigate to next file in jump list
vim.keymap.set("n", "<C-i>", "<C-i>", { desc = "Go to next jump" })

-- Disable Ctrl+; in insert mode globally so it doesn't insert ';'
-- vim.keymap.set("i", "<C-Space>", "<Nop>", { silent = true, noremap = true })
