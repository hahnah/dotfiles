-- leader key
vim.g.mapleader = " "

-- increment/decrement numbers
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- window management
vim.keymap.set("n", "<leader>wo", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wO", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current window" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to below window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to above window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make windows equal size" })

-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to left tab" })
vim.keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to right tab" })
