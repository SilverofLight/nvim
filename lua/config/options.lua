local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = true
opt.linebreak = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认新窗口位置
opt.splitright = true
opt.splitbelow = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- theme
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd([[colorscheme dracula]])

-- 留下 5 行
opt.scrolloff = 5

-- autoformat
vim.g.autoformat = true

-- enable deprecation warnings
vim.g.deprecation_warnings = false

-- save history
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- enable spell check
opt.spell = false
opt.spelllang = { "en_us" }

-- fold
opt.foldmethod = indent
opt.foldlevel = 99

-- better jump
opt.jumpoptions = "stack"

-- undo
opt.undofile = true
opt.undolevels = 10000
