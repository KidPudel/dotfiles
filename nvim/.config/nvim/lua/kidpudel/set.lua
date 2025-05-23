-- line numbers
vim.opt.nu = false
vim.opt.relativenumber = false

-- tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.expandtab = false

vim.opt.smartindent = true

-- no bs linewrap
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false -- maybe
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- incremental/smart search /something* =
vim.opt.incsearch = true

-- highlight matching character
vim.opt.showmatch = true

--vim.opt.guicursor = "n:blinkon0"

-- at least 8 is space top/bottom of the screen present
vim.opt.scrolloff = 8

-- ?
vim.opt.updatetime = 50

vim.g.maplocalleader = "\\"
vim.g.mapleader = " "

-- general bindings
vim.keymap.set("n", "<leader>%", "<cmd>vsplit<cr>")
vim.keymap.set("n", '<leader>"', "<cmd>split<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>:noh<cr>")
-- move line up and down
vim.keymap.set("n", "<C-j>", "<cmd>:m .+1<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>:m .-2<cr>")
-- Move selected block of code down
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
-- Move selected block of code up
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Indent line in normal mode
vim.keymap.set("n", "<C-l>", ">>")
-- Unindent line in normal mode
vim.keymap.set("n", "<C-h>", "<<")

-- Indent selected block in visual mode
vim.keymap.set("v", "<C-l>", ">gv")
-- Unindent selected block in visual mode
vim.keymap.set("v", "<C-h>", "<gv")

-- vim.keymap.set("n", "<leader>cz", ":lua require('cmp').setup.buffer {enabled = false}")
-- vim.keymap.set("n", "<leader>cc", ":lua require('cmp').setup.buffer {enabled = true}")
vim.keymap.set("n", "<leader>cz", function()
	vim.opt.nu = not vim.opt.nu:get()
end, { silent = true })
