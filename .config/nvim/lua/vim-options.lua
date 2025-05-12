vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.scrolloff = 8

vim.opt.guicursor = {
  "n-v-c:block",                                  -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25",                                -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20",                                   -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50",                                      -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250",        -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

-- Tab
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader><tab>q", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader><tab>h", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader><leader><tab>", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Buffer line
-- Move between buffers
vim.keymap.set("n", "<leader>1", ":lua require('bufferline').go_to(1, true)<CR>",
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>2", ":lua require('bufferline').go_to(2, true)<CR>",
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>3", ":lua require('bufferline').go_to(3, true)<CR>",
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>4", ":lua require('bufferline').go_to(4, true)<CR>",
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>5", ":lua require('bufferline').go_to(5, true)<CR>",
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>6", ":lua require('bufferline').go_to(6, true)<CR>",
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>7", ":lua require('bufferline').go_to(7, true)<CR>",
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>8", ":lua require('bufferline').go_to(8, true)<CR>",
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>9", ":lua require('bufferline').go_to(9, true)<CR>",
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>$", ":lua require('bufferline').go_to(-1, true)<CR>",
  { noremap = true, silent = true })

-- Cycle through buffers
vim.keymap.set("n", "[b", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]b", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- Dismiss Noice Message
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- Silicon command
vim.keymap.set("v", "<leader>;", ":'<,'>Silicon<CR>", { desc = "Screenshot Code" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Splits
vim.keymap.set("n", "<c-v>", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-s>", ":split<CR>", { noremap = true, silent = true })

-- Remove serch
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Buffer actions
vim.keymap.set("n", "<Leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<Leader>q", "<cmd>q<CR>")
vim.keymap.set("n", "<Leader>z", "<cmd>wq<CR>")

-- lazy
vim.keymap.set("n", "<leader>l", ":Lazy<cr>", { desc = "Lazy" })

-- Press 'S' for quick find/replace for the word under the cursor
vim.keymap.set("n", "S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Open spectre for global find/replace
vim.keymap.set("n", "<leader>S", function()
  require("spectre").toggle()
end)
