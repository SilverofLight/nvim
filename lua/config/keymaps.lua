local key = vim.keymap
vim.g.mapleader = " "

key.set("i", "jk", "<ESC>")
key.set("i", "<C-e>", "<Esc>A")
key.set("i", "<C-a>", "<Esc>I")
key.set("i", "<C-q>", "<++>")

key.set("n", "s", "<nop>")

key.set("n", "<leader>o", "/<++><CR><cmd>nohl<CR>c4l")
key.set("n", "<leader>i", "?<++><CR><cmd>nohl<CR>c4l")
key.set("n", "<leader>nh", "<cmd>nohl<CR>")

-- quick quit
key.set("n", "<leader>qq", "<cmd>q<cr>")
key.set("n", "<leader>wq", "<cmd>wq<cr>")

-- easy way to go to the end of a line
key.set("n", "<leader>e", "$")
key.set("v", "<leader>e", "$")
key.set("n", "<leader>a", "0")
key.set("v", "<leader>a", "0")

-- 窗口切换
key.set("n", "<leader>h", "<C-w>h")
key.set("n", "<leader>j", "<C-w>j")
key.set("n", "<leader>k", "<C-w>k")
key.set("n", "<leader>l", "<C-w>l")

-- window resize
key.set("n", "<up>", "<cmd>res +2<CR>")
key.set("n", "<down>", "<cmd>res -2<CR>")
key.set("n", "<left>", "<cmd>vertical resize -2<CR>")
key.set("n", "<right>", "<cmd>vertical resize +2<CR>")

-- move lines
key.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
key.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- exit v mode
key.set("v", "io", "<ESC>")

-- add split
key.set("n", "sl", "<C-w>v")
key.set("n", "sh", "<C-w>s")

-- nvim-tree
-- key.set("n", "tt", ":NvimTreeToggle<CR>")

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
key.set("n", "tu", "<cmd>tabnew<cr>")
key.set("n", "J", "<cmd>tabprevious<cr>")
key.set("n", "K", "<cmd>tabnext<cr>")

-- hop config
key.set("n", "<C-f>", "<cmd>HopWord<CR>")

-- togglewrap
function ToggleWrap()
    if vim.opt.wrap:get() then
        vim.opt.wrap = false
    else
        vim.opt.wrap = true
    end
end

key.set("n", "<leader>wr", [[<cmd>lua ToggleWrap()<CR>]])
key.set("n", "<C-w>", "14<C-e>")

function ToggleSpell()
    if vim.opt.spell:get() then
        vim.opt.spell = false
    else
        vim.opt.spell = true
    end
end

key.set("n", "sp", [[<cmd>lua ToggleSpell()<CR>]])

-- terminal
key.set("n", "<leader>gt", "<cmd>vsplit term://fish<CR>")
key.set("t", "<C-s>", "<C-\\><C-n>")

-- markdown preview
key.set("n", "<leader>p", "<cmd>MarkdownPreview<CR>")

-- buffer
key.set("n", "H", "<cmd>BufferLineCyclePrev<CR>")
key.set("n", "L", "<cmd>BufferLineCycleNext<CR>")
key.set("n", "<leader>bd", "<cmd>bdelete<CR>")
