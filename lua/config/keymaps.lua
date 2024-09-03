local key = vim.keymap
vim.g.mapleader = " "

key.set("i", "jk", "<ESC>")
key.set("i", "<C-e>", "<Esc>A")
key.set("i", "<C-q>", "<++>")

key.set("n", "s", "<nop>")

key.set("n", "<leader>o", "/<++><CR>:nohl<CR>c4l")
key.set("n", "<leader>i", "?<++><CR>:nohl<CR>c4l")
key.set("n", "<leader>nh", ":nohl<CR>")

-- quick quit
key.set("n", "<leader>qq", ":q<cr>")
key.set("n", "<leader>wq", ":wq<cr>")

-- easy way to go to the end of a line
key.set("n", "<leader>e", "$")

-- 窗口切换
key.set("n", "<leader>h", "<C-w>h")
key.set("n", "<leader>j", "<C-w>j")
key.set("n", "<leader>k", "<C-w>k")
key.set("n", "<leader>l", "<C-w>l")

-- window resize
key.set("n", "<up>", ":res +2<CR>")
key.set("n", "<down>", ":res -2<CR>")
key.set("n", "<left>", ":vertical resize -2<CR>")
key.set("n", "<right>", ":vertical resize +2<CR>")

-- move lines
key.set("v", "J", ":m '>+1<CR>gv=gv")
key.set("v", "K", ":m '<-2<CR>gv=gv")

-- exit v mode
key.set("v", "io", "<ESC>")

-- add split
key.set("n", "sl", "<C-w>v")
key.set("n", "sh", "<C-w>s")

-- nvim-tree
key.set("n", "tt", ":NvimTreeToggle<CR>")

-- ; -> :
key.set("n", ";", ":")

-- better J K 
key.set("n", "<C-j>", "5j")
key.set("n", "<C-k>", "5k")
key.set("v", "<C-j>", "5j")
key.set("v", "<C-k>", "5k")
key.set("n", "<C-h>", "8h")
key.set("n", "<C-l>", "8l")
key.set("v", "<C-h>", "8h")
key.set("v", "<C-l>", "8l")

-- tab
key.set("n", "tu", ":tabnew<cr>")
key.set("n", "J", ":tabprevious<cr>")
key.set("n", "K", ":tabnext<cr>")

-- hop config
key.set("n", "<C-f>", ":HopVertical<CR>")

