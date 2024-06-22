-- explorer in tree style
vim.cmd("let g:netrw_liststyle = 3")

-- file
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.undofile = true

-- use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- appearance
vim.opt.termguicolors = true

-- cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.scrolloff = 100
vim.opt.mouse = ""

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- line wrapping
vim.opt.wrap = false

-- indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
